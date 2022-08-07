import 'package:chaining/API_Provider/Functions/Functions.dart';
import 'package:chaining/API_Provider/Historyprovider.dart';
import 'package:chaining/API_Provider/Userprovider.dart';
import 'package:chaining/Classes/AssetCoin.dart';
import 'package:chaining/Classes/CoinHistory.dart';
import 'package:flutter/material.dart';

class StatusManager {
  Future<bool> logIn(
      String loginEmail, String loginPassword, var context) async {
    //Try to Login
    bool loginSuccess = false;
    try {
      loginSuccess =
          await Userprovider().userLogin(loginPassword, loginEmail) as bool;
    } catch (e) {
      print(e);
      return false;
    }

    //Login Successfully?
    if (loginSuccess) {
      //Load Top Winner Today
      bool? topWinner = await Functions().addTopWinnerToList();
      List<AssetCoin> topWinnerCoins = await Historyprovider().getTopWinner();

      //Drawing Graphs
      List<CoinHistory> winnerOne = await Historyprovider()
          .getHistoryOfCoin(topWinnerCoins.elementAt(0).id.toString(), "h1");

      List<CoinHistory> winnerTwo = await Historyprovider()
          .getHistoryOfCoin(topWinnerCoins.elementAt(1).id.toString(), "h1");

      //Load Suggestions
      bool? addSuggestion = await Functions().addSuggestionsToList();

      //Load Coin Data (Trade Page)
      bool? loadCoinData = await Functions().parseCoinDataToList();

      //Navigate to Dashboard
      Navigator.pushNamed(context, "/root");
      return true;
    } else {
      //Login was not successfully
      return false;
    }
  }
}
