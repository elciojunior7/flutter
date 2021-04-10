import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learning/components/combustivel/Resultado.dart';

class Combustivel extends StatefulWidget {
  Combustivel({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _Calculo createState() => _Calculo();
}

class _Calculo extends State<Combustivel> {
  final gasolina = TextEditingController();
  final alcool = TextEditingController();
  String result = "vazio";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Melhor combustível'),
      ),
      body: Container(
        margin: EdgeInsets.all(55),
        child: Column(
          children: [ 
            TextField(
              controller: gasolina,
              obscureText: false,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
              ], 
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                hintText: "Gasolina",
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: alcool,
              obscureText: false,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                hintText: "Álcool",
              ),
            ),
            SizedBox(
              height: 35.0,
            ),
            ButtonTheme(
              minWidth: 190.0,
              height: 50.0,
              child: 
                RaisedButton(
                  child: Text('Calcular', style: TextStyle(fontSize: 19)),
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: () { 
                  setState(() {
                    double comp = (double.parse(gasolina.text.replaceAll(",", "."))) * 0.7;
                    result = comp > double.parse(alcool.text.replaceAll(",", ".")) ? "Álcool" : "Gasolina";
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Resultado(result)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}