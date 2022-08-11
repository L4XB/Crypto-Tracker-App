import 'package:chaining/overall_widgets/widgets/button.dart';
import 'package:chaining/overall_widgets/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

final GlobalKey<ScaffoldState> scaffoldkeyCoins = GlobalKey<ScaffoldState>();

class Coins extends StatelessWidget {
  const Coins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldkeyCoins,
      drawer: Container(
          width: width * 0.6,
          child: const Drawer(
            backgroundColor: Color.fromARGB(255, 23, 23, 23),
            child: const DrawerData(),
          )),
      backgroundColor: const Color.fromARGB(255, 23, 23, 23),
      body: Container(
          width: double.infinity,
          height: height,
          color: const Color.fromARGB(255, 23, 23, 23),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 55, 340, 0),
              child: InkWell(
                onTap: () {
                  scaffoldkeyCoins.currentState!.openDrawer();
                },
                child: const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 140, 0, 0),
              child: Container(
                  height: height * 0.3,
                  child: Image.asset("assets/images/einkaufswagen.png")),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
              child: ButtonLogIn(
                  color: Color.fromARGB(210, 161, 255, 208),
                  text: "Buy your first Coins",
                  onPressed: () {
                    Navigator.pushNamed(context, "/buy");
                  }),
            )
          ])),
    );
  }
}
