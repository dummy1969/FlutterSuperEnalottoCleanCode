import 'package:flutter_superenalotto_cleancode/1_domain/entities/eurojackpot_entity.dart';
import 'package:equatable/equatable.dart';

class EuroJackpotModel extends EuroJackpotEntity with EquatableMixin {
  EuroJackpotModel({required estrazioni, required get10})
      : super(estrazioni: estrazioni, get10: get10);

  factory EuroJackpotModel.fromJson(Map<String, dynamic> json) =>
      EuroJackpotModel(
        estrazioni: List<String>.from(json["estrazioni"].map((x) => x)),
        get10: json["get10"],
      );

  Map<String, dynamic> toJson() => {
        "estrazioni": List<dynamic>.from(estrazioni!.map((x) => x)),
        "get10": get10,
      };
}
