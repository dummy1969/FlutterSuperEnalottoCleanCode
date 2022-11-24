import 'package:flutter_superenalotto_cleancode/1_domain/entities/eurojackpot_entity.dart';
import 'package:equatable/equatable.dart';

class EuroJackpotModel extends EuroJackpotEntity with EquatableMixin {
  EuroJackpotModel({required estrazioni, required get10})
      : super(estrazioni: estrazioni, get10: get10);

  factory EuroJackpotModel.fromJson(Map<String, dynamic> json) {
    return EuroJackpotModel(
        estrazioni: json['estrazioni'], get10: json['getStar']);
  }
}
