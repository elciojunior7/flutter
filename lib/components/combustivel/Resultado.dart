import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  String result;
  Resultado(this.result);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Combustível com melhor custo-benefício:", 
              style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              "$result", 
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.green[900])),
            SizedBox(
              height: 100.0,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}