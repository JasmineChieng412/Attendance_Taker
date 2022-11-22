import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'users.dart';


class DatabaseHelper{
  Future<Database> initializedDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'users.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE users(phone TEXT NOT NULL PRIMARY KEY , name TEXT NOT NULL,checkIn INTEGER NOT NULL)",
        );
      },
    );
  }

  // insert data
  Future<int> insertUsers(List<Users> userList) async {
    int result = 0;
    final Database db = await initializedDB();
    for (var user in userList) {
      result = await db.insert('users', user.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

    return result;
  }

  // retrieve data
  Future<List<Users>> retrieveUsers() async {
    final Database db = await initializedDB();
    final List<Map<String, Object?>> queryResult = await db.query('users');
    return queryResult.map((e) => Users.fromMap(e)).toList();
  }

  // delete user
  Future<void> deleteUser(int phone) async {
    final db = await initializedDB();
    await db.delete(
      'users',
      where: "phone = ?",
      whereArgs: [phone],
    );
  }

}