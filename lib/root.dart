import 'package:chaining/coins/coins_foreground.dart';
import 'package:chaining/dashboard/dashboard_foreground.dart';
import 'package:chaining/profile/profile_foreground.dart';
import 'package:chaining/trade/trade_foreground.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;

  //Seiten
  final List<Widget> _pages = <Widget>[
    const Dashboard(),
    const Coins(),
    const Overview(),
    const Profile(),
  ];

  // Bei click auf ein Tab, wird die ausgewählte Seite aufgerufen.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),

      //Navigation Bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(
            color: Colors.white.withOpacity(0.5),
            width: 1,
          ),
        )),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(255, 23, 23, 23),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Overview"),
            BottomNavigationBarItem(
                icon: Icon(Icons.monetization_on), label: "Coins"),
            BottomNavigationBarItem(icon: Icon(Icons.balance), label: "Trade"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 122, 90, 229),
          unselectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
