import 'package:flutter/material.dart';
import 'package:golf_app/savedRounds.dart';
import 'body.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Golf Score App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Container(
              width: 40,
              child: Image.asset('assets/golfball.png'),
            ),
            centerTitle: true,
          ),
          body: savedRounds()),
    );
  }
}
