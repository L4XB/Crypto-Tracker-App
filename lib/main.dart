import 'package:chaining/API_AND_DATABASE/Local_Database/Database_Functions/Database_Functions.dart';
import 'package:chaining/coin_buy/buy_coin.dart';
import 'package:chaining/coin_detail_info.dart/coin_detail_info_foreground.dart';
import 'package:chaining/dashboard/dashboard_foreground.dart';
import 'package:chaining/decide_page.dart';
import 'package:chaining/introduction/introduction.dart';
import 'package:chaining/invite_firiend/invite_friend_foregound.dart';
import 'package:chaining/login_screen/login_screen_foreground.dart';
import 'package:chaining/reset_mail_screen/reset_mail_screen_foreground.dart';
import 'package:chaining/reset_password_screen/reset_password_foreground.dart';
import 'package:chaining/root.dart';
import 'package:chaining/theme.dart';
import 'package:chaining/user_profile/user_profile_foreground.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const Chaining());
}

class Chaining extends StatefulWidget {
  const Chaining({Key? key}) : super(key: key);

  @override
  State<Chaining> createState() => _ChainingState();
}

class _ChainingState extends State<Chaining> {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/logIn": (BuildContext context) => const LoginScreen(),
        "/resetPassword": (BuildContext context) => const ResetPasswordScreen(),
        "/resetMail": (BuildContext context) => const ResetMailScreen(),
        "/coinDetails": (BuildContext context) => const CoinDetailInfo(),
        "/dashboard": (BuildContext context) => const Dashboard(),
        "/invFriend": (BuildContext context) => const InviteFriend(),
        "/introduction": (BuildContext context) => const Introduction(),
        "/buy": (BuildContext context) => const BuyCoin(),
        "/editProfile": (BuildContext context) => const UserProfileForeground(),
        "/root": (BuildContext context) => const Root(),
      },
      home: DecidePage(),
    );
  }
}
