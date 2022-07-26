import 'dart:math';
import 'package:chaining/API_Provider/Assetsprovider.dart';
import 'package:chaining/API_Provider/Functions/Functions.dart';
import 'package:chaining/API_Provider/Historyprovider.dart';
import 'package:chaining/Classes/AssetCoin.dart';
import 'package:chaining/Classes/CoinHistory.dart';
import 'package:chaining/Dashboard/dashboard_foreground.dart';
import 'package:chaining/overall_widgets/widgets/button.dart';
import 'package:chaining/overall_widgets/widgets/text_box.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool text = true;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //Controller
    TextEditingController controllerEmail = TextEditingController();
    TextEditingController controllerCode = TextEditingController();
    TextEditingController controllerPassword = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(80, 56, 56, 56),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 110, 0, 0),
                child: Center(
                  child: Text(
                    "chaining.",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: TextBoxLogIn(
                  controller: controllerEmail,
                  inputText: "Email",
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                child: Stack(children: [
                  TextBoxLogIn(
                    controller: controllerCode,
                    inputText: "Code",
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(300, 18, 0, 0),
                    child: Text(
                      "GET",
                      style: TextStyle(
                          color: Color.fromARGB(210, 161, 255, 208),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                child: TextBoxLogIn(
                  controller: controllerPassword,
                  inputText: "Password",
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      setState(() {
                        text = false;
                        loading = true;
                      });

                      //Top Winner
                      bool? topWinner = await Functions().addTopWinnerToList();
                      List<AssetCoin> topWinnerCoins =
                          await Historyprovider().getTopWinner();

                      List<CoinHistory> winnerOne = await Historyprovider()
                          .getHistoryOfCoin(
                              topWinnerCoins.elementAt(0).id.toString(), "h1");

                      List<CoinHistory> winnerTwo = await Historyprovider()
                          .getHistoryOfCoin(
                              topWinnerCoins.elementAt(1).id.toString(), "h1");
                      //load suggestions from API
                      bool? addSuggestion =
                          await Functions().addSuggestionsToList();
                      //load Coins from API
                      bool? loadCoinData =
                          await Functions().parseCoinDataToList();
                      Navigator.pushNamed(context, "/root");
                    },
                    child: Container(
                      height: 45,
                      width: 180,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(212, 0, 0, 0),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 63, 63, 63),
                            ),
                            BoxShadow(
                              color: Color.fromARGB(255, 57, 57, 57),
                              spreadRadius: -12.0,
                              blurRadius: 12.0,
                            ),
                          ]),
                      child: Center(
                        child: Stack(children: [
                          Visibility(
                            visible: text,
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                  color: Color.fromARGB(210, 161, 255, 208),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Visibility(
                            visible: loading,
                            child: Center(
                              child: LoadingAnimationWidget.waveDots(
                                color: Color.fromARGB(210, 161, 255, 208),
                                size: 40,
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: ButtonLogIn(
                  onPressed: () {},
                  color: const Color.fromARGB(210, 161, 255, 208),
                  text: "Sign Up",
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: ButtonLogIn(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/resetPassword");
                  },
                  color: const Color.fromARGB(210, 255, 161, 161),
                  text: "Reset Password",
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: ButtonLogIn(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/resetMail");
                  },
                  color: const Color.fromARGB(210, 255, 161, 161),
                  text: "Change E-mail",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
