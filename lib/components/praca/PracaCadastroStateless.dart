import 'package:flutter/material.dart';
import 'package:flutter_learning/components/praca/PracaDTO.dart';
import 'package:flutter_learning/provider/ProviderPraca.dart';
import 'package:provider/provider.dart';

class CadastroStateless extends StatelessWidget {
  final PracaDTO _praca;
  final nome = TextEditingController();
  final telefone = TextEditingController();
  final endereco = TextEditingController();
  final fundadaem = TextEditingController();

  CadastroStateless(this._praca);

  @override
  Widget build(BuildContext context) {
    nome.text = _praca.nome;
    telefone.text = _praca.telefone;
    endereco.text = _praca.endereco;
    fundadaem.text = _praca.fundadaem;
    final ProviderPraca providerPraca = Provider.of(context);
    final _form = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar(
          title: Text("Veja esta Praça"),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(30, 30, 30, 5),
          child: Form(
            key: _form,
              child: Column(
              children: [ 
                TextFormField(
                  controller: nome,
                  obscureText: false, 
                  validator: (value){
                    if(value == null || value.trim().isEmpty)
                      return "Nome é obrigatório";
                    else if(value.trim().length < 5)
                      return "Nome deve ter ao menos 5 caracteres";
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    hintText: "Nome",
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: telefone,
                  obscureText: false,
                  validator: (value){
                    if(value == null || value.trim().isEmpty)
                      return "Telefone é obrigatório";
                    else if(value.trim().length != 13)
                      return "Digite telefone no formato: 11 12345-6789";
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    hintText: "Telefone",
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: endereco,
                  obscureText: false, 
                  validator: (value){
                    if(value == null || value.trim().isEmpty)
                      return "Endereço é obrigatório";
                    else if(value.trim().length < 4)
                      return "Digite ao menos 4 caracteres";
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    hintText: "Endereço",
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: fundadaem,
                  obscureText: false,
                  validator: (value){
                    if(value == null || value.trim().isEmpty)
                      return "Data de fundação é obrigatória";
                    else if(value.trim().length != 10 || !value.contains("/"))
                      return "Digite data no formato dd/MM/yyyy";
                    return null;
                  },
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
                        if(_form.currentState.validate()){
                          var novaPraca = new PracaDTO(_praca.id, nome.text, telefone.text, endereco.text, fundadaem.text);
                          providerPraca.save(novaPraca);
                          Navigator.of(context).pop();
                        }
                    },
                  ),
                ),
              ],
            ),
          )
        )
      );
  }
}