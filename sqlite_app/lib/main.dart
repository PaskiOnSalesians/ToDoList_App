import 'package:flutter/material.dart';
import 'package:sqlite_app/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UnratedToDoList',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const HomePage(),
      }
    );
  }
}
