import 'package:chaining/overall_widgets/widgets/drawer.dart';
import 'package:flutter/material.dart';

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
          child: Drawer(
            backgroundColor: const Color.fromARGB(255, 23, 23, 23),
            child: DrawerData(),
          )),
      backgroundColor: Color.fromARGB(255, 23, 23, 23),
      body: Container(
          width: double.infinity,
          height: height,
          color: const Color.fromARGB(255, 23, 23, 23),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 55, 340, 0),
              child: InkWell(
                onTap: () {
                  scaffoldkeyCoins.currentState!.openDrawer();
                },
                child: Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ])),
    );
  }
}
