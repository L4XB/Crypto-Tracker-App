import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  IconData? icon = Icons.add;
  Function()? onPresse;
  RoundButton({Key? key, required this.icon, this.onPresse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 40,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 17, 9, 235),
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
        child: InkWell(
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: onPresse,
          child: Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
