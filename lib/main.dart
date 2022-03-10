import 'package:flutter/material.dart';
import 'package:task_app/emtypage.dart';
import 'package:task_app/listTodo.dart';
import 'package:task_app/mainScreen.dart';
import 'package:task_app/settings.dart';
import 'package:task_app/tobuy.dart';
import 'package:task_app/important.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

  runApp(
    MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.amberAccent,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => MainScreen(),
      '/todo': (context) => Home(),
      '/tobuy': (context) => ToBuy(),
      '/imp' : (context) => Important(),
      '/settings' : (context) => MySettings(),
      '/emty' : (context) => BasicTable(),
    },
  ));
}