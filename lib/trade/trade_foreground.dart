import 'package:chaining/API_AND_DATABASE/Functions/Functions.dart';
import 'package:chaining/overall_widgets/widgets/drawer.dart';
import 'package:chaining/overall_widgets/widgets/text_box_prefix.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

ValueNotifier<List<Widget>> listOfAllCoins = ValueNotifier<List<Widget>>([]);

class Overview extends StatefulWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  bool isLoading = false;
  TextEditingController search = TextEditingController();
  Future<void> _refresh() async {
    print("refreshing...");
    setState(() {
      isLoading = true;
      ;
    });
    listOfAllCoins.value.clear();
    setState(() {
      isLoading = false;
    });
    listOfAllCoins.notifyListeners();
    bool bestaetigung = await Functions().parseCoinDataToList() as bool;
    listOfAllCoins.notifyListeners();
    print("Refresh Done!");
    return Future.delayed(Duration(seconds: 1), () {});
  }

  final GlobalKey<ScaffoldState> scaffoldkeyCoins = GlobalKey<ScaffoldState>();

  Future<void> submittSearch(String name) async {
    print("searching...");
    if (search.text.isEmpty) {
      await _refresh();
    } else {
      listOfAllCoins.value.clear();
      bool searchResult = await Functions()
          .searchForACoinAndParseToList((search.text).toLowerCase()) as bool;
    }

    print("Done!");
  }

  Future<void> searchforACoin(String name) async {
    listOfAllCoins.value.clear();
    listOfAllCoins.notifyListeners();
    setState(() {
      isLoading = true;
    });
    String currentSearch = search.text;
    List<String> searchResults = Functions().searchForACoin(currentSearch);
    if (searchResults.isEmpty) {
      await _refresh();
      setState(() {
        isLoading = false;
      });
      return;
    }

    for (var i in searchResults) {
      bool searchsuccess =
          await Functions().searchForACoinAndParseToList(i) as bool;
    }
    setState(() {
      isLoading = false;
    });
    listOfAllCoins.notifyListeners();
  }

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
      backgroundColor: const Color.fromARGB(255, 23, 23, 23),
      body: RefreshIndicator(
        backgroundColor: Colors.white,
        color: Color.fromARGB(255, 23, 23, 23),
        onRefresh: _refresh,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 55, 340, 0),
                child: InkWell(
                  onTap: () {
                    scaffoldkeyCoins.currentState!.openDrawer();
                  },
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: TextBoxPrefix(
                    onChange: searchforACoin,
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
                Visibility(
                  visible: isLoading,
                  child: Center(
                      child: LoadingAnimationWidget.waveDots(
                          color: Colors.white, size: 45)),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
