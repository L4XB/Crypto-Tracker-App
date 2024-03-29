import 'package:chaining/API_AND_DATABASE/Local_Database/Database_Models/Usermodel.dart';
import 'package:chaining/API_AND_DATABASE/Local_Database/Databaseprovider/UserDatabaseProvider.dart';

class DatabaseFunctions {
  Future<bool> getStatusOfCurrentUser() async {
    var currenData = await UserDatabaseProvider().readDatabase();
    if (currenData.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
