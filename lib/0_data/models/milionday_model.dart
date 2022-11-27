import 'package:flutter_superenalotto_cleancode/1_domain/entities/milionday_entity.dart';
import 'package:equatable/equatable.dart';

class MilionDayModel extends MilionDayEntity with EquatableMixin {
  MilionDayModel({required estrazioni}) : super(estrazioni: estrazioni);

  factory MilionDayModel.fromJson(Map<String, dynamic> json) => MilionDayModel(
        estrazioni: List<String>.from(json["estrazioni"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "estrazioni": List<dynamic>.from(estrazioni.map((x) => x)),
      };
}
