import 'package:chaining/overall_widgets/widgets/button.dart';
import 'package:chaining/overall_widgets/widgets/drop_down_menu.dart';
import 'package:chaining/overall_widgets/widgets/go_back_button.dart';
import 'package:chaining/overall_widgets/widgets/text_box.dart';
import 'package:flutter/material.dart';

class BuyCoin extends StatelessWidget {
  const BuyCoin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController dropDownController = TextEditingController();
    TextEditingController dropDownControllerPayment = TextEditingController();
    TextEditingController amount = TextEditingController();
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color.fromARGB(80, 56, 56, 56),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 350, 0),
                    child: GoBackButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Center(
                    child: Text("Buy Coin",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: DropDownMenuWidget(
                      controller: dropDownController,
                      inputText: "Select A Coin",
                      width: 370,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: Container(
                            height: height * 0.08,
                            width: height * 0.08,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(90)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Text("Select A Coin",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: Container(
                              decoration: BoxDecoration(
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
                                ],
                              ),
                              width: 250,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: TextField(
                                    style: const TextStyle(color: Colors.white),
                                    controller: amount,
                                    cursorHeight: 20,
                                    autofocus: false,
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: Colors.white,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 18, horizontal: 15),
                                      fillColor: Color.fromARGB(212, 0, 0, 0),
                                      filled: true,
                                      hintText: "Amount in \$",
                                      hintStyle:
                                          const TextStyle(color: Colors.white),
                                      focusedBorder: InputBorder.none,
                                      border: InputBorder.none,
                                    ),
                                  ))),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                          child: Text(
                            "Your Recevie",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Text(
                            "1.534 SOL",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(210, 161, 255, 208),
                                fontSize: 19),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Text(
                            "5 Stars",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 181, 206, 90),
                                fontSize: 19),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                          child: ButtonLogIn(
                              color: Colors.white,
                              text: "Payment Preview",
                              onPressed: () {}),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: ButtonLogIn(
                              color: Color.fromARGB(210, 161, 255, 208),
                              text: "Buy Now",
                              onPressed: () {
                                //ToDo 2 Bestätigung

                                Navigator.pushNamed(context, "/root");
                              }),
                        )
                      ],
                    ),
                  )
                ]),
          ),
        ));
  }
}
