import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/model/todo.dart';

class DbHelper {
  static final DbHelper _dbHelper = DbHelper._internal();

  String tblTodo = "todo";
  String colId = "id";
  String colTitle = "title";
  String colDescription = "description";
  String colDate = "date";
  String colPriority = "priority";

  DbHelper._internal();

  factory DbHelper() {
    return _dbHelper;
  }

  static Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = "${dir.path}/todos.db";
    var dbTodos = await openDatabase(path, version: 1, onCreate: _createDb);

    await this.insertTodo(Todo("Buy apples", 1, DateTime.now().toString(), "Some random desc"));

    return dbTodos;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute("CREATE TABLE $tblTodo("
        "$colId INTEGER PRIMARY KEY, "
        "$colTitle TEXT, "
        "$colDescription TEXT ,"
        "$colDate TEXT, "
        "$colPriority INTEGER)");
  }

  Future<int> insertTodo(Todo todo) async {
    var db = await this.db;
    var result = await db.insert(tblTodo, todo.toMap());
    return result;
  }

  Future<List> getTodos() async {
    var db = await this.db;
    var result =
        await db.rawQuery("SELECT * FROM $tblTodo ORDER BY $colPriority ASC");
    return result;
  }

  Future<int> getCount() async {
    var db = await this.db;
    var result = Sqflite.firstIntValue(
      await db.rawQuery("SELECT COUNT(*) FROM $tblTodo")
    );
    return result;
  }

  Future<int> updateTodo(Todo todo) async {
    var db = await this.db;
    var result = await db.update(tblTodo, todo.toMap(),
    where: "$colId = ?", whereArgs: [todo.id]);
    return result;
  }

  Future<int> deleteTodo(int id) async {
    var db = await this.db;
    var result = await db.rawDelete("DELETE FROM $tblTodo WHERE $colId = $id");
    return result;
  }

}