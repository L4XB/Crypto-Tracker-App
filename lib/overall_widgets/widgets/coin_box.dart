import 'package:chaining/API_AND_DATABASE/Functions/Functions.dart';
import 'package:chaining/Classes/AssetCoin.dart';
import 'package:chaining/globals.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CoinBox extends StatefulWidget {
  String coinName = "";
  double coinPrice = 0;
  String coinAbkuerzung = "";
  double prozent = 0;
  AssetCoin? coinData;
  String? logo;
  CoinBox(
      {Key? key,
      required this.coinAbkuerzung,
      required this.coinName,
      required this.coinPrice,
      this.logo,
      required this.prozent,
      this.coinData})
      : super(key: key);

  @override
  State<CoinBox> createState() => _CoinBoxState();
}

class _CoinBoxState extends State<CoinBox> {
  bool popup = false;
  bool visiblilityData = true;
  bool visiblilityLoading = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          setState(() {
            visiblilityData = false;
            visiblilityLoading = true;
          });
          currentCoinTrade = widget.coinData as AssetCoin;
          bool? coinDetails =
              await Functions().buildChart(currentCoinTrade, "h1");
          bool? coinDetailsMonth =
              await Functions().buildChart(currentCoinTrade, "d1");

          Navigator.pushNamed(context, "/coinDetails");
          setState(() {
            visiblilityData = true;
            visiblilityLoading = false;
          });
        },
        child: Stack(children: [
          Visibility(
            visible: visiblilityLoading,
            child: Container(
              height: 90,
              width: 370,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: widget.prozent >= 0
                          ? Color.fromARGB(210, 161, 255, 208)
                          : const Color.fromARGB(210, 255, 161, 161)),
                  color: Color.fromARGB(122, 0, 0, 0),
                  borderRadius: BorderRadius.circular(27)),
              child: Center(
                child: LoadingAnimationWidget.waveDots(
                  color: widget.prozent >= 0
                      ? Color.fromARGB(210, 161, 255, 208)
                      : const Color.fromARGB(210, 255, 161, 161),
                  size: 40,
                ),
              ),
            ),
          ),
          Visibility(
            visible: visiblilityData,
            child: Container(
                height: height * 0.1,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: widget.prozent >= 0
                            ? Color.fromARGB(210, 161, 255, 208)
                            : const Color.fromARGB(210, 255, 161, 161)),
                    color: Color.fromARGB(122, 0, 0, 0),
                    borderRadius: BorderRadius.circular(27)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Text(widget.coinName,
                              style: TextStyle(
                                  fontSize: height * 0.02,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Text(widget.coinAbkuerzung,
                              style: TextStyle(
                                  fontSize: height * 0.016,
                                  color: Colors.white)),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 35, 0),
                                  child: Column(
                                    children: [
                                      Text(widget.coinPrice.toString(),
                                          style: TextStyle(
                                              fontSize: height * 0.02,
                                              fontWeight: FontWeight.bold,
                                              color: widget.prozent >= 0
                                                  ? Color.fromARGB(
                                                      210, 161, 255, 208)
                                                  : const Color.fromARGB(
                                                      210, 255, 161, 161))),
                                      Text(widget.prozent.toString() + " %",
                                          style: TextStyle(
                                              fontSize: height * 0.016,
                                              fontWeight: FontWeight.bold,
                                              color: widget.prozent >= 0
                                                  ? Color.fromARGB(
                                                      210, 161, 255, 208)
                                                  : const Color.fromARGB(
                                                      210, 255, 161, 161))),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ]),
      ),
    );
  }
}
