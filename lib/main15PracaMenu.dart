import 'package:flutter/material.dart';
import 'package:flutter_learning/components/praca/Home.dart';
import 'package:flutter_learning/provider/ProviderPraca.dart';
import 'package:provider/provider.dart';

void main() => runApp(_MyAppState());

class _MyAppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProviderPraca>(
          create: (BuildContext context){
             return ProviderPraca(); 
          }
        )
      ],
      child: MaterialApp(
        home: HomePraca(),
      )
    );
  }
}