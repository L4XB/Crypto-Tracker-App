import 'package:chaining/API_AND_DATABASE/Functions/StatusManager.dart';
import 'package:chaining/API_AND_DATABASE/Local_Database/Database_Models/Usermodel.dart';
import 'package:chaining/API_AND_DATABASE/Local_Database/Databaseprovider/UserDatabaseProvider.dart';
import 'package:chaining/overall_widgets/widgets/button.dart';
import 'package:chaining/overall_widgets/widgets/password_text_box.dart';
import 'package:chaining/overall_widgets/widgets/text_box.dart';
import 'package:chaining/reset_mail_screen/reset_mail_screen_foreground.dart';
import 'package:chaining/reset_password_screen/reset_password_foreground.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //TextStatusField
  String textStatus = "Preview";
  Color textStatusColor = Colors.transparent;
  //submitt
  Future<void> submittTextbox(String name) async {}
  //Controller
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerCode = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  bool text = true;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

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
                    padding: EdgeInsets.fromLTRB(316, 18, 0, 0),
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
                child: PasswordTextBox(
                  controller: controllerPassword,
                  inputText: "Password",
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Center(
                  child: Text(
                    textStatus,
                    style: TextStyle(
                        color: textStatusColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      UserModel user = UserModel(
                          image: "Image",
                          email: "Testmailzwei",
                          id: 1,
                          name: "Lukas");
                      try {
                        bool? success =
                            await UserDatabaseProvider().createSingleUser(user);

                        print(success);
                      } catch (e) {
                        print(e);
                      }

                      if (controllerEmail.text.isEmpty ||
                          controllerPassword.text.isEmpty) {
                        setState(() {
                          textStatus = "Please fill out every field";
                          textStatusColor = Color.fromARGB(210, 255, 161, 161);
                        });
                        return;
                      }
                      setState(() {
                        text = false;
                        loading = true;
                      });
                      bool currentStatus = await StatusManager().logIn(
                          controllerEmail.text,
                          controllerPassword.text,
                          context);

                      if (!currentStatus) {
                        setState(() {
                          textStatus = "Ops, somthing went wrong";
                          textStatusColor = Color.fromARGB(210, 255, 161, 161);
                          controllerCode.text = "";
                          controllerEmail.text = "";
                          controllerPassword.text = "";
                        });
                      }

                      setState(() {
                        text = true;
                        loading = false;
                      });
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
                    Navigator.of(context)
                        .push(navigateToPage(ResetPasswordScreen()));
                  },
                  color: const Color.fromARGB(210, 255, 161, 161),
                  text: "Reset Password",
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: ButtonLogIn(
                  onPressed: () {
                    Navigator.of(context)
                        .push(navigateToPage(ResetMailScreen()));
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

Route navigateToPage(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
