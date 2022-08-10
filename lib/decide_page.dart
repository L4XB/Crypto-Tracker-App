import 'package:chaining/API_AND_DATABASE/API_Provider/Historyprovider.dart';
import 'package:chaining/API_AND_DATABASE/Functions/Functions.dart';
import 'package:chaining/API_AND_DATABASE/Local_Database/Database_Functions/Database_Functions.dart';
import 'package:chaining/API_AND_DATABASE/Local_Database/Databaseprovider/UserDatabaseProvider.dart';
import 'package:chaining/Classes/AssetCoin.dart';
import 'package:chaining/Classes/CoinHistory.dart';
import 'package:chaining/dashboard/dashboard_foreground.dart';
import 'package:chaining/globals.dart';
import 'package:chaining/login_screen/login_screen_foreground.dart';
import 'package:chaining/root.dart';
import 'package:flutter/material.dart';

class DecidePage extends StatefulWidget {
  const DecidePage({Key? key}) : super(key: key);

  @override
  State<DecidePage> createState() => _DecidePageState();
}

class _DecidePageState extends State<DecidePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //UserDatabaseProvider().deleteUser(1);
      var succes = await DatabaseFunctions().getStatusOfCurrentUser();

      if (succes) {
        var dataBaseData = await UserDatabaseProvider().readDatabase();
        //LoadData
        currentUser.name = dataBaseData.first.name;
        currentUser.avatarUrl = dataBaseData.first.image;
        currentUser.mail = dataBaseData.first.name;
        sessionToken = dataBaseData.first.sessionToken;
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

        //
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => const Root()));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const LoginScreen()));
      }
    });
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          height: height,
          width: width,
          child: Image.asset(
            "assets/images/splashscreen.png",
            fit: BoxFit.cover,
          )),
    );
  }
}
