import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Player {
  String? name;

  Player();
}

void main() {
  var nico = Player();

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Hello flutter!'),
        ),
        body: Center(
          child: Text('Hello world!'),
        ),
      ),
    );
  }
}
