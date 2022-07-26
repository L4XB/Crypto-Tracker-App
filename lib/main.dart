import 'dart:ffi';

import 'package:chaining/API_Provider/Chartprovider.dart';
import 'package:chaining/coin_detail_info.dart/coin_detail_info_foreground.dart';
import 'package:chaining/dashboard/dashboard_foreground.dart';
import 'package:chaining/login_screen/login_screen_foreground.dart';
import 'package:chaining/reset_mail_screen/reset_mail_screen_foreground.dart';
import 'package:chaining/reset_password_screen/reset_password_foreground.dart';
import 'package:chaining/root.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/logIn": (BuildContext context) => const LoginScreen(),
        "/resetPassword": (BuildContext context) => const ResetPasswordScreen(),
        "/resetMail": (BuildContext context) => const ResetMailScreen(),
        "/coinDetails": (BuildContext context) => const CoinDetailInfo(),
        "/dashboard": (BuildContext context) => const Dashboard(),
        "/root": (BuildContext context) => const Root(),
      },
      home: LoginScreen(),
    );
  }
}
