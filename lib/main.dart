import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_introduction/post_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PostScreen(),

      // di bawah ini configurasi untuk menyalakan darkmode secara automatis
      /*
      darkTheme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.blue.shade900),
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      */
    );
  }
}
