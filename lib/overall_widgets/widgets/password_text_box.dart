import 'package:flutter/material.dart';

class PasswordTextBox extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  String inputText = "";
  PasswordTextBox({Key? key, required this.controller, required this.inputText})
      : super(key: key);

  @override
  State<PasswordTextBox> createState() => _PasswordTextBoxState();
}

class _PasswordTextBoxState extends State<PasswordTextBox> {
  bool textobscure = true;
  Color eyeColor = Colors.white;
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
        width: 371,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              controller: widget.controller,
              cursorHeight: 20,
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.white,
              obscureText: textobscure,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 24, 0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        textobscure = !textobscure;

                        if (eyeColor == Colors.white) {
                          eyeColor = Color.fromARGB(210, 161, 255, 208);
                        } else {
                          eyeColor = Colors.white;
                        }
                      });
                    },
                    child: Icon(
                      Icons.remove_red_eye_outlined,
                      color: eyeColor,
                    ),
                  ),
                ),
                prefixIconColor: Colors.white,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                fillColor: Color.fromARGB(212, 0, 0, 0),
                filled: true,
                hintText: widget.inputText,
                hintStyle: const TextStyle(color: Colors.white),
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            )));
  }
}
