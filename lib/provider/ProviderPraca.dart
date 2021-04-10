import 'package:flutter/material.dart';
import 'package:flutter_learning/components/praca/PracaDTO.dart';
import 'package:flutter_learning/repository/PracaRepository.dart';

class ProviderPraca with ChangeNotifier {

  Future list() {
    return PracaRepository.list();
  }

  void save(PracaDTO novaPraca){
    PracaRepository.save(novaPraca);
    notifyListeners();
  }

  void delete(PracaDTO novaPraca){
    PracaRepository.delete(novaPraca.id);
    notifyListeners();
  }
}