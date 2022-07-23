import 'package:chaining/API_Provider/Assetsprovider.dart';
import 'package:chaining/Classes/AssetCoin.dart';
import 'package:chaining/overall_widgets/widgets/coin_box.dart';
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
}
