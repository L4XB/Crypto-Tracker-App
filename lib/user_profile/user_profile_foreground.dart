import 'package:chaining/overall_widgets/widgets/go_back_button.dart';
import 'package:flutter/material.dart';

class UserProfileForeground extends StatelessWidget {
  const UserProfileForeground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 23, 23, 23),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 350, 0),
          child: GoBackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ]),
    );
  }
}
