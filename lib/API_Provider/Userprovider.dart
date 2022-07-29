import 'package:dio/dio.dart';

class Userprovider {
  String baseURL = "localhost:3000/users";

  Future<bool?> createUser() async {
    final Response response;
    response = await Dio().post(baseURL, data: {
      "name": "Lukas",
      "email": "Lukas.Buck@e-mail.de",
      "password": "1234",
      "age": 17
    });

    if (response.statusCode == 201) {
      print(response);
      return true;
    }
  }
}
