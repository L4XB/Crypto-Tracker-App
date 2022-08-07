import 'package:chaining/overall_widgets/widgets/button.dart';
import 'package:chaining/overall_widgets/widgets/go_back_button.dart';
import 'package:chaining/overall_widgets/widgets/text_box.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    //Controller
    TextEditingController controllerEmail = TextEditingController();
    TextEditingController controllerEmailCode = TextEditingController();
    TextEditingController controllerPhone = TextEditingController();
    TextEditingController controllerPhoneCode = TextEditingController();
    TextEditingController controllerPassword = TextEditingController();
    TextEditingController controllerConfirmPassword = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(80, 56, 56, 56),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 320, 0),
              child: GoBackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(33, 30, 0, 0),
              child: Text("Change Password",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 50, 0, 0),
              child: TextBoxLogIn(
                  controller: controllerEmail, inputText: "E-mail"),
            ),
            Stack(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 30, 0, 0),
                child: TextBoxLogIn(
                    controller: controllerEmailCode, inputText: "Code"),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(330, 48, 0, 0),
                child: Text(
                  "GET",
                  style: TextStyle(
                      color: Color.fromARGB(210, 161, 255, 208),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 30, 0, 0),
              child:
                  TextBoxLogIn(controller: controllerPhone, inputText: "Phone"),
            ),
            Stack(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 30, 0, 0),
                child: TextBoxLogIn(
                    controller: controllerPhoneCode, inputText: "Code"),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(330, 48, 0, 0),
                child: Text(
                  "GET",
                  style: TextStyle(
                      color: Color.fromARGB(210, 161, 255, 208),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 30, 0, 0),
              child: TextBoxLogIn(
                  controller: controllerPassword, inputText: "Password"),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 30, 0, 0),
              child: TextBoxLogIn(
                  controller: controllerConfirmPassword,
                  inputText: "Confirm Password"),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 50, 0, 0),
              child: ButtonLogIn(
                  color: Color.fromARGB(210, 161, 255, 208),
                  text: "Change Password",
                  onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
