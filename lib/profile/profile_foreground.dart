import 'package:chaining/API_AND_DATABASE/Functions/Functions.dart';
import 'package:chaining/API_AND_DATABASE/API_Provider/Userprovider.dart';
import 'package:chaining/globals.dart';
import 'package:chaining/overall_widgets/widgets/drawer.dart';
import 'package:chaining/overall_widgets/widgets/drawer_buttons.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 23, 23, 23),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 75, 0, 0),
            child: Center(
              child: Container(
                height: height * 0.135,
                width: height * 0.135,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(90)),
                child: currentUser.avatarUrl != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: Image.network(
                          currentUser.avatarUrl.toString(),
                          fit: BoxFit.cover,
                        ))
                    : Container(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Text(
              currentUser.name.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: Text(
              currentUser.mail.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Container(
              height: 285,
              width: 341,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromARGB(122, 0, 0, 0)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 13, 0, 0),
                    child: Row(
                      children: [
                        Text("Default Currency",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(120, 0, 0, 0),
                          child: Icon(Icons.arrow_drop_down,
                              color: Color.fromARGB(255, 122, 90, 229),
                              size: 30),
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
                        Icon(Icons.star,
                            color: Color.fromARGB(255, 181, 206, 90), size: 25),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text("My Stars",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(146, 0, 0, 0),
                          child: Icon(Icons.arrow_right,
                              color: Color.fromARGB(255, 122, 90, 229),
                              size: 30),
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
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/editProfile");
                      },
                      child: Row(
                        children: [
                          Icon(Icons.settings,
                              color: Color.fromARGB(255, 122, 90, 229),
                              size: 25),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text("Settings",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(151, 0, 0, 0),
                            child: Icon(Icons.arrow_right,
                                color: Color.fromARGB(255, 122, 90, 229),
                                size: 30),
                          ),
                        ],
                      ),
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
                        Icon(Icons.attach_money,
                            color: Color.fromARGB(255, 66, 149, 74), size: 25),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text("Payment",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(147, 0, 0, 0),
                          child: Icon(Icons.arrow_right,
                              color: Color.fromARGB(255, 122, 90, 229),
                              size: 30),
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
                        Icon(Icons.history,
                            color: Color.fromARGB(255, 142, 94, 166), size: 25),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text("History",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(159, 0, 0, 0),
                          child: Icon(Icons.arrow_right,
                              color: Color.fromARGB(255, 122, 90, 229),
                              size: 30),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 160, 0, 0),
            child: DrawerButton(
                color: Color.fromARGB(210, 255, 161, 161),
                text: "Log Out",
                onPressed: () async {
                  bool logOut =
                      await Userprovider().userLogout(sessionToken) as bool;

                  if (logOut) {
                    Functions().logOut(context);
                  } else {
                    print("Error by LogOut");
                  }
                }),
          ),
        ],
      ),
    );
  }
}
