import 'package:flutter/material.dart';
import 'package:flutter_learning/components/praca/Praca.dart';
import 'package:flutter_learning/components/praca/PracaDTO.dart';
import 'package:flutter_learning/repository/PracaRepository.dart';

List<PracaDTO> _pracas = [
  new PracaDTO(1,"Praça da Amizade", "12345-6789", "Avenida Nações Unidas - Centro - Bauru", "15/03/1955"),
  new PracaDTO(2,"Praça da Bandeira", "12345-9876", "Avenida Paulista, 1793 - Bela Vista - São Paulo - SP", "25/11/1943")
];

void main() => runApp(MyList());

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praças por aí',
      home: _Lista(),
    );
  }
}

class _Lista extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<_Lista> {
  final title = 'Lista de Praças';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () async {
                await Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => Cadastro()));
                print(_pracas.length);
                setState(() {});
              },
            )
          ],
        ),
        body: ListView.builder(
          itemCount: _pracas.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ResultadoView(_pracas[index])),
                  );
                },
                child: new Card(
                  child: Praca(new PracaDTO(
                      _pracas[index].id,
                      _pracas[index].nome,
                      _pracas[index].telefone,
                      _pracas[index].endereco,
                      _pracas[index].fundadaem)),
                ));
          },
        ),
      ),
    );
  }
}

class ResultadoView extends StatelessWidget {
  final PracaDTO _praca;

  ResultadoView(this._praca);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhe"),
      ),
      body: Center(
        child: Column(
          children: [
            Praca(this._praca),
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: SingleChildScrollView(
                        child: Text(
                            "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.")))),
          ],
        ),
      ),
    );
  }
}

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
                      _pracas.add(novaPraca);
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