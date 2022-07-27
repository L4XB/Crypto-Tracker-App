import 'package:flutter/material.dart';

class InviteFriendTextBox extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  Function()? submitt;
  Icon suffixIcon = Icon(
    Icons.copy,
    color: Colors.white,
  );
  String inputText = "";

  InviteFriendTextBox(
      {Key? key,
      required this.controller,
      required this.inputText,
      required this.submitt,
      required this.suffixIcon})
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
        width: 340,
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
                suffixIcon: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    onTap: submitt,
                    child: suffixIcon),
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
