import 'package:flutter_learning/components/praca/PracaDTO.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PracaRepository{

  static final PracaRepository _singleton = new PracaRepository();

  factory PracaRepository(){
    return _singleton;
  }

  static _databaseManager() async {
    final int versiondb = 1;
    final pathDatabase = await getDatabasesPath();
    final localDatabase = join(pathDatabase, "pracas.db");
    var bd = await openDatabase(localDatabase, version: versiondb, 
    onCreate: (db, versiondb){
      String sql = 
        "create table pracas(id integer primary key, nome varchar, telefone varchar, endereco varchar, fundadaem varchar)";
      db.execute(sql);
    });
    return bd;
  }

  static save(PracaDTO praca) async {
    Database bd = await _databaseManager();
    Map<String, dynamic> dadosPraca = {
      "nome": praca.nome,
      "telefone": praca.telefone,
      "endereco": praca.endereco,
      "fundadaem": praca.fundadaem
    };

    int id = 0;
    if(praca.id != null && praca.id > 0 )
      id = await bd.update("pracas", dadosPraca, where: 'id = ?', whereArgs: [praca.id]);
    else
      id = await bd.insert("pracas", dadosPraca);
    print("salvou $id");
  }

  static Future list() async {
    Database bd= await _databaseManager();
    List listaPracas = await bd.rawQuery("SELECT * FROM pracas");

    var _pracas = new List();
    for (var item in listaPracas) {
      _pracas.add(new PracaDTO(item['id'], item['nome'], item['telefone'],
          item['endereco'], item['fundadaem']));
    }

    return _pracas;
  }

  static delete(int id) async {
     Database bd = await _databaseManager();

     if(id != null && id > 0){
       await bd.delete("pracas", where: "id= ?", whereArgs: [id]);
     }

  }
}