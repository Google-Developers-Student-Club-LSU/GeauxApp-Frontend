import 'package:flutter/material.dart';
import 'package:geaux_app_frontend/screens/login_page.dart';
import 'package:geaux_app_frontend/screens/map_page.dart';
import 'package:geaux_app_frontend/widget/comment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MapPage(),
    );
  }
}
