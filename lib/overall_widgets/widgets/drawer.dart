import 'package:chaining/overall_widgets/widgets/drawer_buttons.dart';
import 'package:flutter/material.dart';

class DrawerData extends StatelessWidget {
  const DrawerData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Container(
            height: height * 0.11,
            width: height * 0.11,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(90)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Text(
            "Hello Lukas!",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: DrawerButton(
              color: Colors.white, text: "Profile", onPressed: () {}),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: DrawerButton(
              color: Colors.white, text: "Invite a Friend", onPressed: () {}),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: DrawerButton(
              color: Colors.white, text: "Private Policy", onPressed: () {}),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: DrawerButton(
              color: Colors.white, text: "Conditions", onPressed: () {}),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 320, 0, 0),
          child: DrawerButton(
              color: Color.fromARGB(210, 255, 161, 161),
              text: "Log Out",
              onPressed: () {}),
        ),
      ],
    );
  }
}
