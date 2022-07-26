import 'package:chaining/globals.dart' as globals;
import 'package:chaining/overall_widgets/widgets/go_back_button.dart';
import 'package:chaining/overall_widgets/widgets/round_button.dart';
import 'package:flutter/material.dart';

class CoinDetailInfo extends StatelessWidget {
  const CoinDetailInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(80, 56, 56, 56),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        globals.currentCoinTrade.name.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Text(
                        " (" + globals.currentCoinTrade.symbol.toString() + ")",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Container(
                      height: 250,
                      width: 341,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color.fromARGB(122, 0, 0, 0)),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            RoundButton(
                              icon: Icons.add,
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 14, 0, 0),
                              child: Text("Buy",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Column(
                          children: [
                            RoundButton(
                              icon: Icons.remove,
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 14, 0, 0),
                              child: Text("Sell",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Column(
                          children: [
                            RoundButton(
                              icon: Icons.output_sharp,
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 14, 0, 0),
                              child: Text("Send",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Column(
                          children: [
                            RoundButton(
                              icon: Icons.compare_arrows,
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 14, 0, 0),
                              child: Text("Convert",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 14, 0, 0),
                    child: Divider(
                      thickness: 1.3,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      "General Informations",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Container(
                      height: 240,
                      width: 341,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color.fromARGB(122, 0, 0, 0)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 13, 0, 0),
                            child: Row(
                              children: [
                                Text("Price",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(115, 0, 0, 0),
                                    child: Text(
                                      globals.currentCoinTrade.priceUsd!
                                              .toStringAsFixed(2) +
                                          " \$",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              210, 161, 255, 208)),
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Divider(
                              thickness: 0.4,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 6, 0, 0),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text("Last 24h",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(88, 0, 0, 0),
                                    child: Text(
                                      globals.currentCoinTrade
                                              .chnagePercent24Hr!
                                              .toStringAsFixed(2) +
                                          " %",
                                      style: TextStyle(
                                          color: globals.currentCoinTrade
                                                      .chnagePercent24Hr! >=
                                                  0
                                              ? Color.fromARGB(
                                                  210, 161, 255, 208)
                                              : Color.fromARGB(
                                                  210, 255, 161, 161)),
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Divider(
                              thickness: 0.4,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 6, 0, 0),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text("Market Cap.",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(60, 0, 0, 0),
                                    child: Text(
                                      globals.currentCoinTrade.marketCapUsd!
                                          .toStringAsFixed(2),
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              210, 161, 255, 208)),
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Divider(
                              thickness: 0.4,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 6, 0, 0),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text("Supply",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(104, 0, 0, 0),
                                  child: Text(
                                    globals.currentCoinTrade.supply!
                                        .toStringAsFixed(2),
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(210, 161, 255, 208)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Divider(
                              thickness: 0.4,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 6, 0, 0),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(11, 0, 0, 0),
                                  child: Text("Volume",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(97, 0, 0, 0),
                                    child: Text(
                                      globals.currentCoinTrade.volumeUsd24Hr!
                                          .toStringAsFixed(2),
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              210, 161, 255, 208)),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ])));
  }
}
