import 'package:flutter/material.dart';
import 'package:flutter_learning/components/praca/PracaDTO.dart';
import 'package:flutter_learning/repository/PracaRepository.dart';

class Cadastro extends StatefulWidget {
  Cadastro({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CadastroView createState() => _CadastroView();
}

class _CadastroView extends State<Cadastro> {
  final nome = TextEditingController();
  final telefone = TextEditingController();
  final endereco = TextEditingController();
  final fundadaem = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Veja esta Praça"),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(30, 30, 30, 5),
          child: Column(
            children: [ 
              TextField(
                controller: nome,
                obscureText: false, 
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  hintText: "Nome",
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: telefone,
                obscureText: false,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  hintText: "Telefone",
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: endereco,
                obscureText: false, 
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  hintText: "Endereço",
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: fundadaem,
                obscureText: false,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  hintText: "Fundada em",
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
                    child: Text('Gravar', style: TextStyle(fontSize: 19)),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () { 
                    setState(() {
                      var novaPraca = new PracaDTO(null, nome.text, telefone.text, endereco.text, fundadaem.text);
                      PracaRepository.save(novaPraca); 
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        )
      );

  }
}