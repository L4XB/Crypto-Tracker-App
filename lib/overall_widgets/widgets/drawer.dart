import 'package:chaining/API_Provider/Functions/Functions.dart';
import 'package:chaining/API_Provider/Userprovider.dart';
import 'package:chaining/globals.dart';
import 'package:chaining/invite_firiend/invite_friend_foregound.dart';
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
            child: Functions().imageStatus() == true
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: Image.network(
                      currentUser.avatarUrl.toString(),
                      fit: BoxFit.cover,
                    ))
                : Container(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Text(
            "Hello " + currentUser.name.toString() + "!",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: DrawerButton(
              color: Colors.white,
              text: "Profile",
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/editProfile");
              }),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: DrawerButton(
              color: Colors.white,
              text: "Invite a Friend",
              onPressed: () {
                Navigator.pop(context);
                List<int> numbers = Functions().generateRandomNumbers(5, 9);
                String data;
                data = "https://chaining/user/invite/";
                for (var i in numbers) {
                  data = data.toString() + i.toString();
                }
                controllerInv.text = data;
                Navigator.pushNamed(context, "/invFriend");
              }),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: DrawerButton(
              color: Colors.white,
              text: "Private Policy",
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: DrawerButton(
              color: Colors.white,
              text: "Conditions",
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 320, 0, 0),
          child: DrawerButton(
              color: Color.fromARGB(210, 255, 161, 161),
              text: "Log Out",
              onPressed: () async {
                Navigator.pop(context);
                bool logOut =
                    await Userprovider().userLogout(sessionToken) as bool;

                if (logOut) {
                  bool success = Functions().logOut(context);
                  if (success) {
                    Navigator.pushNamed(context, "/logIn");
                  } else {
                    print("Error by LogOut");
                  }
                } else {}
              }),
        ),
      ],
    );
  }
}
