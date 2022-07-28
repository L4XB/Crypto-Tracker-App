import 'package:chaining/overall_widgets/widgets/button.dart';
import 'package:chaining/overall_widgets/widgets/go_back_button.dart';
import 'package:chaining/overall_widgets/widgets/user_profile_textbox.dart';
import 'package:flutter/material.dart';

class UserProfileForeground extends StatelessWidget {
  const UserProfileForeground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController mailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController streetController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 23, 23, 23),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 350, 0),
              child: GoBackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Center(
              child: Text("Account Settings",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Center(
                child: Container(
                  height: height * 0.135,
                  width: height * 0.135,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(90)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
              child: UserProfileTextBox(
                  controller: mailController,
                  inputText: "Enter your new Mail",
                  width: width * 0.4),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: UserProfileTextBox(
                  controller: firstNameController,
                  inputText: "Enter your first Name",
                  width: width * 0.4),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: UserProfileTextBox(
                  controller: mailController,
                  inputText: "Enter your Name",
                  width: width * 0.4),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UserProfileTextBox(
                      controller: streetController,
                      inputText: "Adresse",
                      width: width * 0.195),
                  Padding(
                    padding: EdgeInsets.fromLTRB(width * 0.01, 0, 0, 0),
                    child: UserProfileTextBox(
                        controller: numberController,
                        inputText: "Number",
                        width: width * 0.195),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: UserProfileTextBox(
                  controller: phoneNumberController,
                  inputText: "Enter your Phone Number",
                  width: width * 0.4),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 95, 0, 0),
              child: ButtonLogIn(
                  color: Color.fromARGB(210, 161, 255, 208),
                  text: "Safe Changes",
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            )
          ]),
        ),
      ),
    );
  }
}
