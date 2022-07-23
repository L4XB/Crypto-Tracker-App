import 'package:chaining/overall_widgets/widgets/round_button.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController contollerpage = PageController();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: height,
            color: const Color.fromARGB(255, 23, 23, 23),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 45, 340, 0),
                child: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.menu),
                  iconSize: 30,
                  onPressed: () {},
                ),
              ),
              const Text("792,87 €",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 39,
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
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
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 14, 0, 0),
                child: Divider(
                  thickness: 1.3,
                  color: Colors.white,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text("Top Winner Today",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.arrow_left_sharp,
                        color: Colors.white, size: 35),
                    Container(
                      height: 250,
                      width: 341,
                      child: PageView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              height: 250,
                              width: 341,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              child: Column(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Text("Ethereum",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 250,
                              width: 341,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              child: Column(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Text("Solana",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ),
                    Icon(Icons.arrow_right_sharp,
                        color: Colors.white, size: 35),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text("Suggestions For You",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 20, 0, 0),
                child: Row(
                  children: [
                    Container(
                      height: 90,
                      width: 341,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text("Solana",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                )),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_right_sharp,
                        color: Colors.white, size: 35),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 10, 0, 0),
                child: Row(
                  children: [
                    Container(
                      height: 90,
                      width: 341,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color.fromARGB(255, 0, 0, 0)),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text("Solana",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                )),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_right_sharp,
                        color: Colors.white, size: 35),
                  ],
                ),
              ),
            ])));
  }
}
