import 'package:flutter/material.dart';
import 'package:flutter_learning/components/praca/ItemListModalBottom.dart';
import 'package:flutter_learning/components/praca/Praca.dart';
import 'package:flutter_learning/components/praca/PracaCadastroStateless.dart';
import 'package:flutter_learning/components/praca/PracaDTO.dart';
import 'package:flutter_learning/provider/ProviderPraca.dart';
import 'package:provider/provider.dart';

class HomePraca extends StatelessWidget {
  final title = 'Lista de Praças';

  @override
  Widget build(BuildContext context) {

    void _showMenuOptions(BuildContext context, praca){
      showModalBottomSheet(
        context: context, 
        builder: (context){
          return Wrap(children: <Widget>[
              ItemListModal(EnumMenuItem.edit, praca, context), 
              ItemListModal(EnumMenuItem.remove, praca, context),
              ItemListModal(EnumMenuItem.call, praca, context),
              ItemListModal(EnumMenuItem.maps, praca, context),
              ItemListModal(EnumMenuItem.cancel, praca, context),
            ]
          );
        }
      );
    }

    Future _listPracas(BuildContext context){
      final ProviderPraca providerPraca = Provider.of(context);
      return providerPraca.list();
    }

    return Scaffold(
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
                      builder: (context) => CadastroStateless(PracaDTO.empty())));
            },
          )
        ],
      ),
      body: Container(
        child: FutureBuilder(
          future: _listPracas(context),
          builder:(context, snapshot){
            if (snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: new Card(
                      child: Praca(snapshot.data[index]),
                    ),
                    onTap: () {
                      _showMenuOptions(context, snapshot.data[index]);
                    },
                  );
                }
              );
            }
            return CircularProgressIndicator();
          }
        )
      ),
    );    
  }
}