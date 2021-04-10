import 'package:flutter/material.dart';
import 'package:flutter_learning/components/rodada/ResultadoPartida.dart';

void main() {
  runApp(Placar());
}

class Placar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Placar',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Partidas da Rodada'),
          ),
          body: Partida(new ResultadoPartida("Linense", 5, "Palmeiras", 1)),
        ),
    );
  }
}

class Partida extends StatelessWidget {

  final ResultadoPartida resultado;
  Partida(this.resultado);

  @override
  Widget build(BuildContext context) {
     return Container(
      margin: EdgeInsets.only(top:30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 2.0),
                  child: Image.asset(
                    'assets/images/brasil.png',
                    width: 40,
                  ),
                )
            ],
          ),
          Column(
            children: [
              Text(this.resultado.mandante, style: TextStyle(fontSize: 20)), 
              Text(this.resultado.mandanteGols.toString(), style: TextStyle(fontSize: 40))
              ],
          ),
          Column(
            children: [Text("X", style: TextStyle(fontSize: 30))],
          ),
          Column(
            children: [
              Text(this.resultado.visitante, style: TextStyle(fontSize: 20)), 
              Text(this.resultado.visitanteGols.toString(), style: TextStyle(fontSize: 40))
            ],
          ),
          Column(
            children: [
              Image.asset(
                'assets/images/alemanha.png',
                width: 45,
              )
            ],
          ),
        ],
      ),
    );
  }
}