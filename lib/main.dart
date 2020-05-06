import 'package:flutter/material.dart';
import 'game.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'Tic Tac Toe',
            style: TextStyle(
              fontSize: 50.0,
              color: Colors.teal,
              fontWeight: FontWeight.bold,
              fontFamily: 'Pacifico',
            ),
          ),
        ),
        body: SafeArea(child: Center(child: gamePage())),
      ),
    );
  }
}
