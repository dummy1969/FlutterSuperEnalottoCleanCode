import 'package:flutter_superenalotto_cleancode/1_domain/entities/superenalotto_entity.dart';
import 'package:equatable/equatable.dart';

class SuperEnalottoModel extends SuperEnalottoEntity with EquatableMixin {
  SuperEnalottoModel({required estrazioni, required getStar})
      : super(estrazioni: estrazioni, getStar: getStar);

  factory SuperEnalottoModel.fromJson(Map<String, dynamic> json) {
    return SuperEnalottoModel(
        estrazioni: json['estrazioni'], getStar: json['getStar']);
  }
}
