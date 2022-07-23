import 'package:flutter/material.dart';

var loadingOne = true;
var loadingTwo = false;

class ButtonLogIn extends StatefulWidget {
  Color color = Color.fromARGB(210, 161, 255, 208);
  String text = "";
  Function()? onPressed = () {};
  ButtonLogIn(
      {Key? key,
      required this.color,
      required this.text,
      required this.onPressed})
      : super(key: key);

  @override
  State<ButtonLogIn> createState() => _ButtonLogInState();
}

class _ButtonLogInState extends State<ButtonLogIn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        height: 45,
        width: 180,
        decoration: BoxDecoration(
            color: Color.fromARGB(212, 0, 0, 0),
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
            ]),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
                color: widget.color, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
