import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  Color color = Colors.white;
  String text = "";
  Function()? onPressed = () {};
  DrawerButton(
      {Key? key,
      required this.color,
      required this.text,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 150,
        decoration: BoxDecoration(
            color: Color.fromARGB(212, 0, 0, 0),
            borderRadius: BorderRadius.circular(10),
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
            text,
            style: TextStyle(
                color: color, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
