import 'dart:math';
import 'package:chaining/API_Provider/Assetsprovider.dart';
import 'package:chaining/Classes/AssetCoin.dart';
import 'package:chaining/dashboard/dashboard_foreground.dart';
import 'package:chaining/globals.dart';
import 'package:chaining/overall_widgets/widgets/coin_box.dart';
import 'package:chaining/overall_widgets/widgets/dashboard_suggestions_box.dart';
import 'package:chaining/trade/trade_foreground.dart';

class Functions {
  Future<bool?> parseCoinDataToList() async {
    List<AssetCoin> allCoins = await Assetsprovider().getAllAssets();
    for (var i in allCoins) {
      listOfAllCoins.value.add(CoinBox(
        coinAbkuerzung: i.symbol.toString(),
        coinName: i.name.toString(),
        coinPrice: double.parse(
          (i.priceUsd)!.toStringAsFixed(6),
        ),
        prozent: double.parse(
          (i.chnagePercent24Hr)!.toStringAsFixed(6),
        ),
      ));
      listOfAllCoins.notifyListeners();
    }
    return true;
  }

  Future<bool?> searchForACoinAndParseToList(String id) async {
    AssetCoin coin = AssetCoin();
    coin = await Assetsprovider().getspecificAsset(id);
    listOfAllCoins.value.clear();
    listOfAllCoins.value.add(CoinBox(
      coinAbkuerzung: coin.symbol.toString(),
      coinName: coin.name.toString(),
      coinPrice: double.parse(
        (coin.priceUsd)!.toStringAsFixed(6),
      ),
      prozent: double.parse(
        (coin.chnagePercent24Hr)!.toStringAsFixed(6),
      ),
    ));
    listOfAllCoins.notifyListeners();
    return true;
  }

  Future<bool?> addSuggestionsToList() async {
    var anzahl = 9;
    var zahlEins = Random().nextInt(anzahl);
    var zahlZwei = Random().nextInt(anzahl);
    var zahlDrei = Random().nextInt(anzahl);
    var zahlVier = Random().nextInt(anzahl);
    if (zahlEins == zahlZwei) {
      zahlZwei = Random().nextInt(anzahl);
    }
    if (zahlDrei == zahlVier) {
      zahlVier = Random().nextInt(anzahl);
    }
    var coinOne = await Assetsprovider().getspecificAsset(
        (dictonaryOfAllAssets.elementAt(zahlEins)).toLowerCase());
    var coinTwo = await Assetsprovider().getspecificAsset(
        (dictonaryOfAllAssets.elementAt(zahlZwei)).toLowerCase());
    var coinThree = await Assetsprovider().getspecificAsset(
        (dictonaryOfAllAssets.elementAt(zahlDrei)).toLowerCase());
    var coinFour = await Assetsprovider().getspecificAsset(
        (dictonaryOfAllAssets.elementAt(zahlVier)).toLowerCase());

    listOfsuggestionsOne.value.add(SuggestionsBox(
        coinAbkuerzung: coinOne.symbol.toString(),
        coinName: coinOne.name.toString(),
        coinPrice: double.parse(coinOne.priceUsd!.toStringAsFixed(6)),
        prozent: double.parse(coinOne.chnagePercent24Hr!.toStringAsFixed(6))));
    listOfsuggestionsOne.value.add(SuggestionsBox(
        coinAbkuerzung: coinTwo.symbol.toString(),
        coinName: coinTwo.name.toString(),
        coinPrice: double.parse(coinTwo.priceUsd!.toStringAsFixed(6)),
        prozent: double.parse(coinTwo.chnagePercent24Hr!.toStringAsFixed(6))));
    listOfsuggestionsTwo.value.add(SuggestionsBox(
        coinAbkuerzung: coinThree.symbol.toString(),
        coinName: coinThree.name.toString(),
        coinPrice: double.parse(coinThree.priceUsd!.toStringAsFixed(6)),
        prozent:
            double.parse(coinThree.chnagePercent24Hr!.toStringAsFixed(6))));
    listOfsuggestionsTwo.value.add(SuggestionsBox(
        coinAbkuerzung: coinFour.symbol.toString(),
        coinName: coinFour.name.toString(),
        coinPrice: double.parse(coinFour.priceUsd!.toStringAsFixed(6)),
        prozent: double.parse(coinFour.chnagePercent24Hr!.toStringAsFixed(6))));

    listOfsuggestionsOne.notifyListeners();
    listOfsuggestionsTwo.notifyListeners();
    return true;
  }
}
