import 'package:chaining/API_AND_DATABASE/API_Provider/Functions/Functions.dart';
import 'package:chaining/overall_widgets/widgets/button.dart';
import 'package:chaining/overall_widgets/widgets/go_back_button.dart';
import 'package:chaining/overall_widgets/widgets/invite_friend_textbox.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

TextEditingController controllerInv = TextEditingController();

class InviteFriend extends StatefulWidget {
  const InviteFriend({Key? key}) : super(key: key);

  @override
  State<InviteFriend> createState() => _InviteFriendState();
}

class _InviteFriendState extends State<InviteFriend> {
  String? newLink;
  @override
  Widget build(BuildContext context) {
    void submitt() {
      print(newLink);
      FlutterClipboard.copy(controllerInv.text).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Color.fromARGB(80, 84, 84, 84),
            content: Padding(
              padding: const EdgeInsets.fromLTRB(95, 0, 0, 0),
              child: Text(
                'Copied to your clipboard !',
                style: TextStyle(color: Colors.white),
              ),
            )));
      });
      ;
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(80, 56, 56, 56),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 350, 0),
            child: GoBackButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                Navigator.pop(context);
              },
            ),
          ),
          Center(
            child: Text("Invite A Friend",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Center(
              child: Text("Get 5€ For Every Invited Friend",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 45, 0, 0),
            child: InviteFriendTextBox(
                controller: controllerInv,
                inputText: "",
                submitt: submitt,
                suffixIcon: Icon(
                  Icons.copy,
                  color: Colors.white,
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: ButtonLogIn(
                color: Color.fromARGB(210, 161, 255, 208),
                text: "Generate New Link",
                onPressed: () {
                  List<int> numbers = Functions().generateRandomNumbers(5, 9);
                  newLink = "https://chaining/user/invite/";
                  for (var i in numbers) {
                    newLink = newLink.toString() + i.toString();
                  }

                  setState(() {
                    controllerInv.text = newLink.toString();
                  });
                }),
          )
        ],
      ),
    );
  }
}
