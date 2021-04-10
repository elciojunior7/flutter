import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout'),
        ),
        // Change to buildColumn() for the other column example
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch ,
          children: [
            Image.asset(
              'assets/images/argentina.jpg',
              height: 100,
              width: 100,
            ),
            Image.asset(
              'assets/images/paraguai.jpg',
              height: 100,
              width: 100,
            ),
          ],
        )),
      ),
    );
  }
}