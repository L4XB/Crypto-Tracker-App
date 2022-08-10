import 'package:chaining/API_AND_DATABASE/Local_Database/Database_Functions/Database_Functions.dart';
import 'package:chaining/API_AND_DATABASE/Local_Database/Databaseprovider/UserDatabaseProvider.dart';
import 'package:chaining/dashboard/dashboard_foreground.dart';
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
      if (await DatabaseFunctions().getStatusOfCurrentUser()) {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => Root()));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => LoginScreen()));
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
