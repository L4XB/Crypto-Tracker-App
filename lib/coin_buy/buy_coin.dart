import 'package:chaining/overall_widgets/widgets/go_back_button.dart';
import 'package:flutter/material.dart';

class BuyCoin extends StatelessWidget {
  const BuyCoin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(80, 56, 56, 56),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Container(
              height: 600,
              width: 370,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(35),
                  color: Color.fromARGB(122, 0, 0, 0)),
              child: Column(
                children: [],
              ),
            ),
          )
        ]));
  }
}
