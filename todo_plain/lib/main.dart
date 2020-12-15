import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_plain/screens/home_page.dart';
import 'package:flutter/services.dart';
import 'package:todo_plain/services/todo_service.dart';

GetIt getIt = GetIt.instance;

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  getIt.registerSingleton<TodoService>(TodoService(), signalsReady: true);

  runApp(HomePage());
}
