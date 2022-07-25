import 'package:flutter/material.dart';

class TopWinner extends StatelessWidget {
  String nameCoin = "";
  Widget child = Container();
  TopWinner({Key? key, required this.nameCoin, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 341,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Color.fromARGB(122, 0, 0, 0)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(nameCoin,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                )),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
