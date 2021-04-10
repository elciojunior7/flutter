import 'package:flutter/material.dart';
import 'package:flutter_learning/components/rodada/DetalhePartida.dart';
import 'package:flutter_learning/components/rodada/ResultadoPartida.dart';
import 'package:flutter_learning/main5.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

List<ResultadoPartida> _resultados = [
  new ResultadoPartida("Brasil", 4, "Alemanha", 0),
  new ResultadoPartida("Corinthians", 8, "Palmeiras", 0),
  new ResultadoPartida("Brasil", 4, "Alemanha", 0),
  new ResultadoPartida("Corinthians", 8, "Palmeiras", 0),
  new ResultadoPartida("Linense", 5, "Palmeiras", 1),
  new ResultadoPartida("Brasil", 4, "Alemanha", 0),
  new ResultadoPartida("Corinthians", 8, "Palmeiras", 0),
  new ResultadoPartida("Linense", 5, "Palmeiras", 1)
];

  @override
  Widget build(BuildContext context) {
    final title = 'Basic List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: _resultados.length,
          itemBuilder: (context, index){
            return InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetalhePartida(_resultados[index])),
                );
              },
              child: new Card(
                color: Colors.grey[200],
                child: Partida(
                  new ResultadoPartida(
                    _resultados[index].mandante, 
                    _resultados[index].mandanteGols, 
                    _resultados[index].visitante, 
                    _resultados[index].visitanteGols, 
                  )
                )
              )
            );
          },
        ),
      ),
    );
  }
}