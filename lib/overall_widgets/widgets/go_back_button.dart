import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  Function()? onPressed = () {};
  GoBackButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 65,
      decoration: const BoxDecoration(
          color: Color.fromARGB(212, 0, 0, 0),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
          boxShadow: [
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
        onTap: onPressed,
        child: const Icon(
          Icons.arrow_left,
          color: Colors.white,
        ),
      ),
    );
  }
}
