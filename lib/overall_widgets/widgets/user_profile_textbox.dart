import 'package:flutter/material.dart';

class UserProfileTextBox extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  String inputText = "";
  double width = 0;
  UserProfileTextBox(
      {Key? key,
      required this.controller,
      required this.inputText,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 63, 63, 63),
            ),
            BoxShadow(
              color: Color.fromARGB(255, 57, 57, 57),
              spreadRadius: -12.0,
              blurRadius: 12.0,
            ),
          ],
        ),
        width: width,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              controller: controller,
              cursorHeight: 20,
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                suffixIconColor: Colors.white,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                fillColor: Color.fromARGB(212, 0, 0, 0),
                filled: true,
                hintText: inputText,
                hintStyle: const TextStyle(color: Colors.white),
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            )));
  }
}
