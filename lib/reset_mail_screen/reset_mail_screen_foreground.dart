import 'package:chaining/overall_widgets/widgets/button.dart';
import 'package:chaining/overall_widgets/widgets/go_back_button.dart';
import 'package:chaining/overall_widgets/widgets/text_box.dart';
import 'package:flutter/material.dart';

class ResetMailScreen extends StatelessWidget {
  const ResetMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerEmail = TextEditingController();
    TextEditingController controllerEmailCode = TextEditingController();
    TextEditingController controllerPhone = TextEditingController();
    TextEditingController controllerPhoneCode = TextEditingController();
    TextEditingController controllerMail = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(80, 56, 56, 56),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: GoBackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Center(
                child: Text("Change E-mail",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Center(
                child: TextBoxLogIn(
                    controller: controllerEmail, inputText: "E-mail"),
              ),
            ),
            Stack(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Center(
                  child: TextBoxLogIn(
                      controller: controllerEmailCode, inputText: "Code"),
                ),
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
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Center(
                  child: TextBoxLogIn(
                      controller: controllerPhone, inputText: "Phone")),
            ),
            Stack(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Center(
                  child: TextBoxLogIn(
                      controller: controllerPhoneCode, inputText: "Code"),
                ),
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
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Center(
                child: TextBoxLogIn(
                    controller: controllerMail, inputText: "New E-mail"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Center(
                child: ButtonLogIn(
                    color: Color.fromARGB(210, 161, 255, 208),
                    text: "Change E-mail",
                    onPressed: () {}),
              ),
            )
          ],
        ),
      ),
    );
  }
}
