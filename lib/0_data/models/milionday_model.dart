import 'package:flutter_superenalotto_cleancode/1_domain/entities/milionday_entity.dart';
import 'package:equatable/equatable.dart';

class MilionDayModel extends MilionDayEntity with EquatableMixin {
  MilionDayModel({required estrazioni}) : super(estrazioni: estrazioni);

  factory MilionDayModel.fromJson(Map<String, dynamic> json) {
    return MilionDayModel(estrazioni: json['estrazioni']);
  }
}
