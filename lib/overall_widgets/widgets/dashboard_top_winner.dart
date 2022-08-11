import 'package:chaining/API_AND_DATABASE/Functions/Functions.dart';
import 'package:chaining/Classes/AssetCoin.dart';
import 'package:chaining/globals.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class TopWinner extends StatefulWidget {
  String nameCoin = "";
  Widget child = Container();
  AssetCoin? coin;
  TopWinner({Key? key, required this.nameCoin, required this.child, this.coin})
      : super(key: key);

  @override
  State<TopWinner> createState() => _TopWinnerState();
}

class _TopWinnerState extends State<TopWinner> {
  bool visibilityContainerOverly = false;
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
              child: Text(widget.nameCoin,
                  style: TextStyle(
                    color: widget.coin!.chnagePercent24Hr!.toDouble() > 0
                        ? Color.fromARGB(210, 161, 255, 208)
                        : Color.fromARGB(210, 255, 161, 161),
                    fontSize: 18,
                  )),
            ),
            Expanded(child: widget.child),
          ],
        ),
      ),
      InkWell(
          onTap: () async {
            setState(() {
              visibilityContainerOverly = true;
            });
            currentCoinTrade = widget.coin as AssetCoin;
            bool? coinDetails =
                await Functions().buildChart(currentCoinTrade, "h1");
            bool? coinDetailsMonth =
                await Functions().buildChart(currentCoinTrade, "d1");

            Navigator.pushNamed(context, "/coinDetails");
            setState(() {
              visibilityContainerOverly = false;
            });
          },
          child: Container(
            height: 250,
            width: 341,
          )),
      Visibility(
        visible: visibilityContainerOverly,
        child: Container(
          height: 250,
          width: 341,
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
              ),
              borderRadius: BorderRadius.circular(25),
              color: Color.fromARGB(122, 0, 0, 0)),
          child: Center(
            child: LoadingAnimationWidget.waveDots(
              color: Color.fromARGB(210, 161, 255, 208),
              size: 40,
            ),
          ),
        ),
      )
    ]);
  }
}
