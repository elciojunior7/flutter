import 'package:flutter/material.dart';
import 'package:flutter_learning/components/praca/PracaCadastroStateless.dart';
import 'package:flutter_learning/components/praca/PracaDTO.dart';
import 'package:flutter_learning/provider/ProviderPraca.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_learning/components/praca/PracaGoogleMap.dart';

// ignore: must_be_immutable
class ItemListModal extends StatelessWidget {
  final EnumMenuItem menuItem;
  final PracaDTO umaPraca;
  final BuildContext context;

  ItemListModal(this.menuItem, this.umaPraca, this.context);

  Map<EnumMenuItem, ItemListDTO> mapOptions = Map.unmodifiable({
    EnumMenuItem.edit: new ItemListDTO("Editar", Icons.edit, Colors.green, Colors.grey[100]),
    EnumMenuItem.remove: new ItemListDTO("Excluir", Icons.delete_forever, Colors.red, Colors.grey[100]),
    EnumMenuItem.call: new ItemListDTO("Ligar", Icons.call, Colors.blue[200], Colors.grey[800]),
    EnumMenuItem.maps: new ItemListDTO("Ver no Mapa", Icons.map, Colors.green[200], Colors.grey[800]),
    EnumMenuItem.cancel: new ItemListDTO("Cancelar", Icons.cancel, Colors.white, Colors.grey[800]),
  });

  @override
  Widget build(BuildContext context) {
    ItemListDTO _itemOptions = mapOptions[menuItem];
    TextStyle style = TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: _itemOptions.optionTextColor);

    //action when onTap is launched
    dynamic onTapOption;
    switch (menuItem) {
      case EnumMenuItem.edit:
      onTapOption = () async {
            Navigator.pop(context);
            await Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => CadastroStateless(umaPraca))
            );
      };
      break;
      case EnumMenuItem.remove:
      onTapOption = () {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Excluir Praça"),
              content: Text("Confirma a exclusão?"),
              actions: <Widget>[
                FlatButton(
                  onPressed:() =>  Navigator.of(context).pop(),
                  child: Text('Cancelar'),
                ),
                FlatButton(
                  color: Colors.red,
                  onPressed:(){
                    final ProviderPraca providerPraca = Provider.of(context, listen: false);
                    providerPraca.delete(umaPraca);
                    Navigator.of(context).pop();
                  }, 
                  child: Text('Sim', style: TextStyle(color: Colors.white)),
                ),
              ],
            );
          });
      };
      break;
      case EnumMenuItem.call:
      onTapOption = () {
        launch("tel:"+umaPraca.telefone);
        Navigator.pop(context);
      };
      break;
      case EnumMenuItem.maps:
      onTapOption = () async {
        Navigator.pop(context);
        await Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) => GoogleMapView()
          ),
        );
      };
      break;
      case EnumMenuItem.cancel:
      onTapOption = () {
        Navigator.pop(context);
      };
      break;
      
    }
    //---------------------------------

    return Ink(
      height: 70.0,
      color: _itemOptions.optionColor,
      child: Center(
        child: ListTile(
          leading: new Icon(_itemOptions.icon, color: _itemOptions.optionTextColor),
          title: new Text(_itemOptions.itemText, style: style),
          onTap: onTapOption
        )
      )
    );
  }
}

class ItemListDTO {
  String itemText;
  IconData icon;
  Color optionColor;
  Color optionTextColor;
  dynamic onTapOption;

  ItemListDTO(this.itemText, this.icon, this.optionColor, this.optionTextColor);
}

enum EnumMenuItem {
  edit,
  remove,
  call,
  maps,
  cancel
}