// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_superenalotto_cleancode/1_domain/entities/superenalotto_entity.dart';

class HomeSchedinaEntity {
  var superEnalotto? =SuperEnalottoEntity;
  var euroJackpot;
  var miliondDay;
  var diecieLotto;
  HomeSchedinaEntity({
    required this.superEnalotto,
    required this.euroJackpot,
    required this.miliondDay,
    required this.diecieLotto,
  });
}
