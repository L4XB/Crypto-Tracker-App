import 'package:chaining/API_Provider/Functions/Functions.dart';
import 'package:chaining/Classes/AssetCoin.dart';
import 'package:chaining/globals.dart';
import 'package:flutter/material.dart';

class TopWinner extends StatelessWidget {
  String nameCoin = "";
  Widget child = Container();
  AssetCoin? coin;
  TopWinner({Key? key, required this.nameCoin, required this.child, this.coin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 250,
        width: 341,
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
            ),
            borderRadius: BorderRadius.circular(25),
            color: Color.fromARGB(122, 0, 0, 0)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(nameCoin,
                  style: const TextStyle(
                    color: Color.fromARGB(210, 161, 255, 208),
                    fontSize: 18,
                  )),
            ),
            Expanded(child: child),
          ],
        ),
      ),
      InkWell(
          onTap: () async {
            currentCoinTrade = coin as AssetCoin;
            bool? coinDetails = await Functions().buildChart(currentCoinTrade);
            Navigator.pushNamed(context, "/coinDetails");
          },
          child: Container(
            height: 250,
            width: 341,
          ))
    ]);
  }
}
