import 'package:chaining/API_Provider/Historyprovider.dart';
import 'package:chaining/Classes/CoinHistory.dart';

class Chart {
  //Get coin Data
  Future<List<CoinHistory>> getCoinData(String id, String interval) async {
    List<CoinHistory> coinData = [];

    coinData = await Historyprovider().getHistoryOfCoin(id, interval);

    return coinData;
  }

  //Draw chart
  void drawChart() {}
}
