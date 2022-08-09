import 'dart:async';
import 'package:chaining/API_AND_DATABASE/Local_Database/Database_Models/Usermodel.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserDatabaseProvider {
  //Open Database for User
  dynamic openUserDatabase(String databaseName, String tableName) async {
    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(
      join(await getDatabasesPath(), databaseName),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE ' +
              tableName +
              '(id INTEGER PRIMARY KEY, name TEXT, email TEXT, image TEXT)',
        );
      },
      version: 1,
    );
    return database;
  }

  //Insert Data
  Future<bool?> insertUserDataIntoDatabase(UserModel user) async {
    final db = await openUserDatabase("ChainingUser.db", "User");
    await db.insert(
      'User',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return true;
  }

  //Read Database
  Future<List<UserModel>> readDatabase() async {
    final db = await openUserDatabase("ChainingUser.db", "User");
    final List<Map<String, dynamic>> maps = await db.query('User');

    return List.generate(maps.length, (i) {
      return UserModel(
          id: maps[i]['id'],
          name: maps[i]['name'],
          email: maps[i]['email'],
          image: maps[i]['image']);
    });
  }

  Future<bool?> deleteAllUser() async {
    final db = await openUserDatabase("ChainingUser.db", "User");
    try {
      for (var i in db["User"]) {
        await db.delete(
          'User',
          where: 'id = ?',
          whereArgs: [i + 1],
        );
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> deleteUser(int id) async {
    final db = await openUserDatabase("ChainingUser.db", "User");
    await db.delete(
      'User',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //createSingleUser
  Future<bool?> createSingleUser(UserModel user) async {
    try {
      bool deleteUser = await deleteAllUser() as bool;

      bool inserstUser = await insertUserDataIntoDatabase(user) as bool;

      print(await readDatabase());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
