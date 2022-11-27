import 'package:flutter_superenalotto_cleancode/1_domain/entities/superenalotto_entity.dart';
import 'package:equatable/equatable.dart';

class SuperEnalottoModel extends SuperEnalottoEntity with EquatableMixin {
  SuperEnalottoModel({required estrazioni, required getStar})
      : super(estrazioni: estrazioni, getStar: getStar);

  factory SuperEnalottoModel.fromJson(Map<String, dynamic> json) =>
      SuperEnalottoModel(
        estrazioni: List<String>.from(json["estrazioni"].map((x) => x)),
        getStar: json["getStar"],
      );

  Map<String, dynamic> toJson() => {
        "estrazioni": List<dynamic>.from(estrazioni.map((x) => x)),
        "getStar": getStar,
      };
}
