import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Inbox",
      theme: ThemeData(
        primaryColor: Color(0xFF3EBACE),
        accentColor: Color(0xFFD99ECF1),
        scaffoldBackgroundColor: Color(0XFFF3f5f7)
      ),
      home: HomeScreen(),
    );
  }
}