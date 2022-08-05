import 'package:chaining/dashboard/dashboard_foreground.dart';
import 'package:chaining/root.dart';
import 'package:flutter/material.dart';
import 'package:introduction_slider/introduction_slider.dart';

class Introduction extends StatefulWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(80, 56, 56, 56),
      body: IntroductionSlider(
        selectedDotColor: Colors.white,
        descriptionTextStyle: TextStyle(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white),
        unselectedDotColor: Color.fromARGB(146, 255, 255, 255),
        dotSize: 10.0,
        skip: Text(
          "SKIP",
          style: TextStyle(color: Colors.white),
        ),
        next: Text("NEXT", style: TextStyle(color: Colors.white)),
        done: Text("DONE", style: TextStyle(color: Colors.white)),
        onDone: Root(),
        items: [
          IntroductionSliderItem(
            image: FlutterLogo(),
            title: "Welcome to chaining.",
            description: "This is a description of introduction slider 1.",
          ),
          IntroductionSliderItem(
            image: FlutterLogo(),
            title: "Introduction Slider 2",
            description: "This is a description of introduction slider 2.",
          ),
          IntroductionSliderItem(
            image: FlutterLogo(),
            title: "Introduction Slider 3",
            description: "This is a description of introduction slider. 3",
          ),
        ],
      ),
    );
  }
}
