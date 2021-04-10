import 'package:flutter/material.dart';
import 'package:flutter_learning/components/praca/PracaDTO.dart';
class Praca extends StatelessWidget {

  final PracaDTO umaPraca;
  Praca(this.umaPraca);

  @override
  Widget build(BuildContext context) {
     return Container(
      margin: EdgeInsets.only(top:20, bottom:20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Image.asset(
                    'assets/images/praca.jpg',
                    width: 80,
                  ),
                )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(this.umaPraca.nome, style: TextStyle(fontSize: 17, color: Colors.green)), 
              Text(this.umaPraca.endereco, style: TextStyle(fontSize: 13))
              ],
          ),
        ],
      ),
    );
  }
}