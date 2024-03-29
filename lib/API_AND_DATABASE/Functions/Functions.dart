import 'dart:math';
import 'package:chaining/API_AND_DATABASE/API_Provider/Assetsprovider.dart';
import 'package:chaining/API_AND_DATABASE/API_Provider/Historyprovider.dart';
import 'package:chaining/Classes/AssetCoin.dart';
import 'package:chaining/Classes/ChartData.dart';
import 'package:chaining/Classes/CoinHistory.dart';
import 'package:chaining/Classes/User.dart';
import 'package:chaining/coin_detail_info.dart/coin_detail_info_foreground.dart';
import 'package:chaining/dashboard/dashboard_foreground.dart';
import 'package:chaining/globals.dart';
import 'package:chaining/overall_widgets/widgets/coin_box.dart';
import 'package:chaining/overall_widgets/widgets/dashboard_suggestions_box.dart';
import 'package:chaining/overall_widgets/widgets/dashboard_top_winner.dart';
import 'package:chaining/trade/trade_foreground.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_candlestick_chart/simple_candlestick_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
        coinData: i,
      ));
      listOfAllCoins.notifyListeners();
    }
    return true;
  }

  Future<bool?> searchForACoinAndParseToList(String id) async {
    AssetCoin coin = AssetCoin();
    coin = await Assetsprovider().getspecificAsset(id);

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

    return true;
  }

  Future<bool?> addSuggestionsToList() async {
    List<int> numbers = generateRandomNumbers(4, 100);
    var zahlEins = numbers.elementAt(0);
    var zahlZwei = numbers.elementAt(1);
    var zahlDrei = numbers.elementAt(2);
    var zahlVier = numbers.elementAt(3);
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
        coin: coinOne,
        prozent: double.parse(coinOne.chnagePercent24Hr!.toStringAsFixed(6))));

    listOfsuggestionsOne.value.add(SuggestionsBox(
        coinAbkuerzung: coinTwo.symbol.toString(),
        coinName: coinTwo.name.toString(),
        coinPrice: double.parse(coinTwo.priceUsd!.toStringAsFixed(6)),
        coin: coinTwo,
        prozent: double.parse(coinTwo.chnagePercent24Hr!.toStringAsFixed(6))));
    listOfsuggestionsTwo.value.add(SuggestionsBox(
        coinAbkuerzung: coinThree.symbol.toString(),
        coinName: coinThree.name.toString(),
        coin: coinThree,
        coinPrice: double.parse(coinThree.priceUsd!.toStringAsFixed(6)),
        prozent:
            double.parse(coinThree.chnagePercent24Hr!.toStringAsFixed(6))));
    listOfsuggestionsTwo.value.add(SuggestionsBox(
        coinAbkuerzung: coinFour.symbol.toString(),
        coinName: coinFour.name.toString(),
        coin: coinFour,
        coinPrice: double.parse(coinFour.priceUsd!.toStringAsFixed(6)),
        prozent: double.parse(coinFour.chnagePercent24Hr!.toStringAsFixed(6))));

    listOfsuggestionsOne.notifyListeners();
    listOfsuggestionsTwo.notifyListeners();
    return true;
  }

  List<int> generateRandomNumbers(int anzahl, int max) {
    List<int> list = [];
    for (var i = 0; i < anzahl; i++) {
      var number = Random().nextInt(max);
      if (!list.contains(number)) {
        list.add(number);
      } else {
        i--;
      }
    }
    print(list);
    return list;
  }

  Future<bool?> addTopWinnerToList() async {
    List<AssetCoin> topWinner = await Historyprovider().getTopWinner();

    for (var i in topWinner) {
      List<double> min =
          await Historyprovider().getMinOfCoin(i.id.toString(), "h1");
      listOfTopWinner.value.add(TopWinner(
        coin: i,
        nameCoin: i.name.toString(),
        child: SfCartesianChart(
          borderColor: Colors.transparent,
          borderWidth: 0,
          plotAreaBorderWidth: 0,
          series: <SplineSeries>[
            SplineSeries<ChartData, DateTime>(
              dataSource:
                  await Historyprovider().getChartData(i.id.toString(), "h1"),
              xValueMapper: (ChartData sales, _) => sales.x,
              yValueMapper: (datum, index) => datum.high,
              color: i.chnagePercent24Hr!.toDouble() > 0
                  ? Color.fromARGB(210, 161, 255, 208)
                  : Color.fromARGB(210, 255, 161, 161),
            )
          ],
          primaryXAxis: DateTimeAxis(
              borderColor: Colors.transparent,
              majorGridLines: MajorGridLines(width: 0)),
          primaryYAxis: NumericAxis(
              majorGridLines: MajorGridLines(width: 0),
              borderWidth: 0,
              maximum:
                  min.reduce((curr, next) => curr > next ? curr : next) + 0.13,
              minimum:
                  min.reduce((curr, next) => curr < next ? curr : next) - 0.13),
        ),
      ));
    }
    listOfTopWinner.notifyListeners();

    return true;
  }

  Future<bool?> buildChart(AssetCoin input, String interval) async {
    List<double> min =
        await Historyprovider().getMinOfCoin(input.id.toString(), interval);
    chartlist.value.add(TopWinner(
      coin: input,
      nameCoin: input.name.toString(),
      child: SfCartesianChart(
        borderColor: Colors.transparent,
        borderWidth: 0,
        plotAreaBorderWidth: 0,
        series: <SplineSeries>[
          SplineSeries<ChartData, DateTime>(
            dataSource: await Historyprovider()
                .getChartData(input.id.toString(), interval),
            xValueMapper: (ChartData sales, _) => sales.x,
            yValueMapper: (datum, index) => datum.high,
            color: currentCoinTrade.chnagePercent24Hr!.toDouble() > 0
                ? Color.fromARGB(210, 161, 255, 208)
                : Color.fromARGB(210, 255, 161, 161),
          )
        ],
        primaryXAxis: DateTimeAxis(
            borderColor: Colors.transparent,
            majorGridLines: MajorGridLines(width: 0)),
        primaryYAxis: NumericAxis(
            majorGridLines: MajorGridLines(width: 0),
            borderWidth: 0,
            maximum:
                min.reduce((curr, next) => curr > next ? curr : next + 0.13),
            minimum:
                min.reduce((curr, next) => curr < next ? curr : next) - 0.13),
      ),
    ));

    chartlist.notifyListeners();

    return true;
  }

  bool logOut(BuildContext context) {
    print("<--- LogOut --->");
    print("deleating Data...");
    listOfTopWinner.value.clear();
    User userToClear = User();
    currentUser = userToClear;
    listOfAllCoins.value.clear();
    listOfsuggestionsOne.value.clear();
    listOfsuggestionsTwo.value.clear();
    chartlist.value.clear();
    print("deleating Data Done!");
    print("<--- LogOut Done --->");
    return true;
  }

  bool imageStatus() {
    try {
      var response = Uri.parse(currentUser.avatarUrl.toString());
      return true;
    } catch (e) {
      return false;
    }
  }

  List<String> searchForACoin(String snipped) {
    List<String> coins = [];
    for (var i in dictonaryOfAllAssets) {
      if (i.toLowerCase().contains(snipped.toLowerCase())) {
        coins.add(i);
      } else {}
    }

    return coins;
  }
}
