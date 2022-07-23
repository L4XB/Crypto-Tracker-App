import 'package:chaining/API_Provider/Functions/Functions.dart';
import 'package:chaining/overall_widgets/widgets/text_box_prefix.dart';
import 'package:flutter/material.dart';

ValueNotifier<List<Widget>> listOfAllCoins = ValueNotifier<List<Widget>>([]);

class Overview extends StatefulWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  TextEditingController search = TextEditingController();
  Future<void> _refresh() async {
    print("refreshing...");
    listOfAllCoins.value.clear();
    bool bestaetigung = await Functions().parseCoinDataToList() as bool;
    listOfAllCoins.notifyListeners();
    print("Refresh Done!");
    return Future.delayed(Duration(seconds: 1), () {});
  }

  Future<void> submittSearch(String name) async {
    print("searching...");
    if (search.text.isEmpty) {
      _refresh();
    } else {
      bool searchResult = await Functions()
          .searchForACoinAndParseToList((search.text).toLowerCase()) as bool;
    }

    print("Done!");
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 23, 23, 23),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 45, 340, 0),
                child: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.menu),
                  iconSize: 30,
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: TextBoxPrefix(
                    submitt: submittSearch,
                    controller: search,
                    inputText: "Search For A Coin",
                    prexifIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 14, 0, 0),
                child: Divider(
                  thickness: 1.3,
                  color: Colors.white,
                ),
              ),
              Stack(children: [
                Container(
                    child: RefreshIndicator(
                  onRefresh: _refresh,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: ValueListenableBuilder(
                      valueListenable: listOfAllCoins,
                      builder: (context, value, child) => Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          children: value as List<Widget>,
                        ),
                      ),
                    ),
                  ),
                )),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
