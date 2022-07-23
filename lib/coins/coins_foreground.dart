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
            const Text("792,87 €",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 39,
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Container(
                height: 250,
                width: 341,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color.fromARGB(122, 0, 0, 0)),
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.arrow_left_outlined,
                      size: 35, color: Colors.white),
                  Text("Last Month",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                  Icon(Icons.arrow_right_outlined,
                      size: 35, color: Colors.white),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text("Your Coins",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
            ),
          ])),
    );
  }
}
