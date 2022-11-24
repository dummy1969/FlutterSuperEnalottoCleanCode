import 'package:flutter_superenalotto_cleancode/1_domain/entities/diecielotto_entity.dart';
import 'package:equatable/equatable.dart';

class DiecieLottoModel extends DieciELottoEntity with EquatableMixin {
  DiecieLottoModel({required estrazioni})
      : super(
          estrazioni: estrazioni,
        );

  factory DiecieLottoModel.fromJson(Map<String, dynamic> json) {
    return DiecieLottoModel(estrazioni: json['estrazioni']);
  }
}
