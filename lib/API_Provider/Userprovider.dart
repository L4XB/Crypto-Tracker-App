import 'package:chaining/Classes/User.dart';
import 'package:dio/dio.dart';

class Userprovider {
  String baseURL = "localhost:3000/users";

  Future<bool?> createUser(User user) async {
    final Response response;
    response = await Dio().post(baseURL, data: {
      "name": user.name,
      "email": user.mail,
      "password": user.password,
      "age": user.age
    });

    if (response.statusCode == 201) {
      print(response);
      return true;
    }
  }
}
