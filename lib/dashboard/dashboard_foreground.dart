import 'package:chaining/overall_widgets/widgets/dashboard_suggestions_box.dart';
import 'package:chaining/overall_widgets/widgets/drawer.dart';
import 'package:chaining/overall_widgets/widgets/round_button.dart';
import 'package:flutter/material.dart';

ValueNotifier<List<Widget>> listOfsuggestionsOne =
    ValueNotifier<List<Widget>>([]);
ValueNotifier<List<Widget>> listOfsuggestionsTwo =
    ValueNotifier<List<Widget>>([]);
ValueNotifier<List<Widget>> listOfTopWinner = ValueNotifier<List<Widget>>([]);
PageController _pageController = PageController();
PageController topWinnerController = PageController();
PageController contollerpage = PageController();
PageController _pageControllerSug = PageController();
PageController _pageControllerSugTwo = PageController();
final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: scaffoldkey,
        drawer: Container(
            width: width * 0.6,
            child: Drawer(
              backgroundColor: const Color.fromARGB(255, 23, 23, 23),
              child: DrawerData(),
            )),
        body: Container(
            width: double.infinity,
            height: height,
            color: const Color.fromARGB(255, 23, 23, 23),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 55, 340, 0),
                child: InkWell(
                  onTap: () {
                    scaffoldkey.currentState!.openDrawer();
                  },
                  child: Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              const Text("0 \$",
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
                          onPresse: () {
                            Navigator.pushNamed(context, "/buy");
                          },
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
                          icon: Icons.arrow_forward_outlined,
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
                        RoundButton(icon: Icons.more_horiz),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 14, 0, 0),
                          child: Text("More",
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
                  thickness: 1,
                  color: Colors.white,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text("Top Mover",
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
                    InkWell(
                      onTap: () {
                        topWinnerController.animateToPage(0,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeInOut);
                      },
                      child: const Icon(Icons.arrow_left_sharp,
                          color: Colors.white, size: 35),
                    ),
                    Container(
                      height: 250,
                      width: 341,
                      child: Container(
                        width: 100,
                        height: 100,
                        child: PageView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              ValueListenableBuilder(
                                valueListenable: listOfTopWinner,
                                builder: (context, value, child) => PageView(
                                  controller: topWinnerController,
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  children: value as List<Widget>,
                                ),
                              ),
                            ]),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        topWinnerController.nextPage(
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeInOut);
                      },
                      child: Icon(Icons.arrow_right_sharp,
                          color: Colors.white, size: 35),
                    ),
                  ],
                ),
              ),
              //Suggestions
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text("Suggestions",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        _pageControllerSugTwo.animateToPage(0,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeInOut);
                      },
                      child: const Icon(Icons.arrow_left_sharp,
                          color: Colors.white, size: 35),
                    ),
                    Container(
                      height: 90,
                      width: 341,
                      child:
                          PageView(scrollDirection: Axis.horizontal, children: [
                        ValueListenableBuilder(
                          valueListenable: listOfsuggestionsOne,
                          builder: (context, value, child) => PageView(
                            controller: _pageControllerSugTwo,
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            children: value as List<Widget>,
                          ),
                        ),
                      ]),
                    ),
                    InkWell(
                      onTap: () {
                        _pageControllerSugTwo.animateToPage(1,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeInOut);
                      },
                      child: Icon(Icons.arrow_right_sharp,
                          color: Colors.white, size: 35),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        _pageControllerSug.animateToPage(0,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeInOut);
                      },
                      child: const Icon(Icons.arrow_left_sharp,
                          color: Colors.white, size: 35),
                    ),
                    Container(
                      height: 90,
                      width: 341,
                      child:
                          PageView(scrollDirection: Axis.horizontal, children: [
                        ValueListenableBuilder(
                          valueListenable: listOfsuggestionsTwo,
                          builder: (context, value, child) => PageView(
                            controller: _pageControllerSug,
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            children: value as List<Widget>,
                          ),
                        ),
                      ]),
                    ),
                    InkWell(
                      onTap: () {
                        _pageControllerSug.animateToPage(1,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeInOut);
                      },
                      child: Icon(Icons.arrow_right_sharp,
                          color: Colors.white, size: 35),
                    ),
                  ],
                ),
              ),
            ])));
  }
}
