import 'dart:convert';
import 'package:chaining/Classes/AssetCoin.dart';
import 'package:dio/dio.dart';

class Assetsprovider {
  var baseURL = "https://api.coincap.io/v2/";

  // Get a specific coin
  Future<AssetCoin> getspecificAsset(String id) async {
    final Response response;
    response = await Dio().get(baseURL + "assets/" + id);
    if (response.statusCode == 201 || response.statusCode == 200) {
      final body = jsonDecode(response.toString())["data"];
      AssetCoin c = AssetCoin();
      c.id = body["id"];
      c.rank = body["rank"];
      c.symbol = body["symbol"];
      c.name = body["name"];
      c.supply = double.parse(body["supply"]);
      c.marketCapUsd = double.parse(body["marketCapUsd"]);
      c.volumeUsd24Hr = double.parse(body["volumeUsd24Hr"]);
      c.priceUsd = double.parse(body["priceUsd"]);
      c.chnagePercent24Hr = double.parse(body["changePercent24Hr"]);

      return c;
    } else {
      throw Exception("Failed to get coin");
    }
  }

  // Get the list of all coins
  Future<List<AssetCoin>> getAllAssets() async {
    final Response response;
    print(baseURL + "assets");
    response = await Dio().get(baseURL + "assets");
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Got Data Successfully");
      print("Adding to List ...");
      List<AssetCoin> coins = [];

      final List<dynamic> datalist = jsonDecode(response.toString())["data"];

      for (var coin in datalist) {
        AssetCoin c = AssetCoin();
        c.id = coin["id"];
        c.rank = coin["rank"];
        c.symbol = coin["symbol"];
        c.name = coin["name"];
        c.supply = double.parse(coin["supply"]);

        c.marketCapUsd = double.parse(coin["marketCapUsd"]);
        c.volumeUsd24Hr = double.parse(coin["volumeUsd24Hr"]);
        c.priceUsd = double.parse(coin["priceUsd"]);
        c.chnagePercent24Hr = double.parse(coin["changePercent24Hr"]);

        coins.add(c);
      }
      print("Done!");
      return coins;
    } else {
      throw Exception("Failed to get coin");
    }
  }
}
