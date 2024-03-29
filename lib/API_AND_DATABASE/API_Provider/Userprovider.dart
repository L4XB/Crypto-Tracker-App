import 'dart:convert';

import 'package:chaining/Classes/User.dart';
import 'package:chaining/globals.dart';
import 'package:dio/dio.dart';

class Userprovider {
  //BaseURL
  String baseURL = "ur api url";

  //Create User
  Future<bool?> createUser(User user) async {
    Response response;
    response = await Dio().post(baseURL, data: {
      "name": user.name,
      "email": user.mail,
      "password": user.password,
      "age": user.age.toString()
    });

    if (response.statusCode == 201 || response.statusCode == 200) {
      final body = jsonDecode(response.toString())["user"];
      final bodyToken = jsonDecode(response.toString());
      User user = User();
      try {
        user.age = body["age"];
        user.mail = body["email"];
        user.name = body["name"];
        user.id = body["_id"];
        currentUser = user;
        sessionToken = bodyToken["token"];
      } catch (e) {
        print(e);
      }
      print(response);
      return true;
    }
  }

  //Login
  Future<bool?> userLogin(String password, String mail) async {
    Response response;
    response = await Dio()
        .post(baseURL + "/login", data: {"email": mail, "password": password});

    if (response.statusCode == 201 || response.statusCode == 200) {
      final body = jsonDecode(response.toString())["user"];
      final bodyToken = jsonDecode(response.toString());
      User user = User();
      try {
        user.age = body["age"];
        user.mail = body["email"];
        user.name = body["name"];
        user.avatarUrl = "" + body["_id"] + "/avatar";
        currentUser = user;
        sessionToken = bodyToken["token"];
      } catch (e) {
        print(e);
      }

      print(response);
      return true;
    }
  }

  //Logout
  Future<bool?> userLogout(String sessionToken) async {
    Response response;
    response = await Dio().post(baseURL + "/logoutAll",
        options: Options(headers: {
          "Authorization": "Bearer " + sessionToken,
        }));
    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response);
      return true;
    }
  }

  //readCurrentUserData
  Future<User?> readCurrentUserData(String sessionToken) async {
    Response response;
    response = await Dio().get(baseURL + "/me",
        options: Options(headers: {
          "Authorization": "Bearer " + sessionToken,
        }));
    if (response.statusCode == 201 || response.statusCode == 200) {
      User user = User();
      final body = jsonDecode(response.toString());
      user.age = body["age"];
      user.mail = body["email"];
      user.name = body["name"];

      return user;
    }
  }
}
