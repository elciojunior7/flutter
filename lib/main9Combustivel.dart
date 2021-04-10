import 'package:flutter/material.dart';
import 'package:flutter_learning/components/combustivel/Calculo.dart';

void main() {
  runApp(MaterialApp(
    title: 'Combustível',
    theme: ThemeData(primarySwatch: Colors.orange),
    home: Combustivel(),
  ));
}