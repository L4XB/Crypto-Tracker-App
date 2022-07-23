import 'dart:math';
import 'package:chaining/API_Provider/Functions/Functions.dart';
import 'package:chaining/overall_widgets/widgets/button.dart';
import 'package:chaining/overall_widgets/widgets/text_box.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                child: ButtonLogIn(
                  onPressed: () async {
                    print(Random().nextInt(9));
                    bool? loadCoinData =
                        await Functions().parseCoinDataToList();
                    Navigator.pushNamed(context, "/root");
                  },
                  color: const Color.fromARGB(210, 161, 255, 208),
                  text: "Log In",
                ),
              ),
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
