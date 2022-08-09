import 'package:chaining/API_AND_DATABASE/API_Provider/Historyprovider.dart';
import 'package:chaining/API_AND_DATABASE/API_Provider/Userprovider.dart';
import 'package:chaining/API_AND_DATABASE/Functions/Functions.dart';
import 'package:chaining/API_AND_DATABASE/Local_Database/Database_Models/Usermodel.dart';
import 'package:chaining/API_AND_DATABASE/Local_Database/Databaseprovider/UserDatabaseProvider.dart';
import 'package:chaining/Classes/AssetCoin.dart';
import 'package:chaining/Classes/CoinHistory.dart';
import 'package:chaining/globals.dart';
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
      try {
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

        //Add Data to Local Database
        UserModel user = UserModel(
            image: currentUser.avatarUrl.toString(),
            email: currentUser.mail.toString(),
            id: 1,
            name: currentUser.name.toString());

        bool? success = await UserDatabaseProvider().createSingleUser(user);

        //Navigate to Dashboard
        Navigator.pushNamed(context, "/root");
        return true;
      } catch (e) {
        return false;
      }
    } else {
      //Login was not successfully
      return false;
    }
  }
}
