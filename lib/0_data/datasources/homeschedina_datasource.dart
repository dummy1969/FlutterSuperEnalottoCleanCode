import 'package:flutter_superenalotto_cleancode/0_data/models/diecielotto_model.dart';
import 'package:flutter_superenalotto_cleancode/0_data/models/eurojackpot_model.dart';
import 'package:flutter_superenalotto_cleancode/0_data/models/milionday_model.dart';
import 'package:flutter_superenalotto_cleancode/0_data/models/random.dart';
import 'package:flutter_superenalotto_cleancode/0_data/models/superenalotto_model.dart';
import 'package:flutter_superenalotto_cleancode/1_domain/entities/diecielotto_entity.dart';
import 'package:flutter_superenalotto_cleancode/1_domain/entities/eurojackpot_entity.dart';
import 'package:flutter_superenalotto_cleancode/1_domain/entities/home_schedina_entity.dart';
import 'package:flutter_superenalotto_cleancode/1_domain/entities/milionday_entity.dart';
import 'package:flutter_superenalotto_cleancode/1_domain/entities/superenalotto_entity.dart';
import 'package:flutter_superenalotto_cleancode/1_domain/failures/failures.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class HomeSchedinaDatasource {
  Future<HomeSchedinaEntity> getHomeSchedina();
}

class HomeSchedinaLocalSourceImpl implements HomeSchedinaDatasource {
  /// Classe che finalmente implementa la generazione delle schedine
  /// in questo caso localmente

  @override
  Future<HomeSchedinaEntity> getHomeSchedina() async {
    //TODO secondo me a sto punto dovrei andare a recuperare le preferenze delle colonne
    //salvata via shared_preferences, per ora le metto fisse

    try {
      final superEnalotto = SuperEnalotto(2);
      final milionDay = MilionDay(1);
      final euroJackpot = EuroJackpot(1);
      final lotto = DieciLotto(1);

      final superEnalalottoEntity = SuperEnalottoEntity(
          estrazioni: superEnalotto.estrazioni(),
          getStar: superEnalotto.getStar());
      final milionDayEntity =
          MilionDayEntity(estrazioni: milionDay.estrazioni());
      final euroJackpotEntity = EuroJackpotEntity(
          estrazioni: euroJackpot.estrazioni(), get10: euroJackpot.get10());
      final lottoEntity = DieciELottoEntity(estrazioni: lotto.estrazioni());

      final homeSchedinaEntity = HomeSchedinaEntity(
          superEnalotto: superEnalalottoEntity,
          euroJackpot: euroJackpotEntity,
          miliondDay: milionDayEntity,
          diecieLotto: lottoEntity);

      return homeSchedinaEntity;
    } catch (e) {
      // non so pensare cosa in questo caso possa andare storto ma nel caso lancio un exception
      throw GeneralFailure();
    }
  }
}

class HomeSchedinaRemoteSourceImpl implements HomeSchedinaDatasource {
  /// Classe che finalmente implementa la generazione delle schedine
  /// in questo caso via API
  final http.Client client;

  HomeSchedinaRemoteSourceImpl({required this.client});

  @override
  Future<HomeSchedinaEntity> getHomeSchedina() async {
    var response = await client.get(
        Uri.parse('http://vpn.database.it:5238/SuperEnalotto?iNumColonne=2'),
        headers: {'content-type': 'application/json'});
    var responseBody = json.decode(response.body);
    final superEnalottoModel = SuperEnalottoModel.fromJson(responseBody);

    response = await client.get(
        Uri.parse('http://vpn.database.it:5238/DiecieLotto?iNumColonne=2'),
        headers: {'content-type': 'application/json'});
    responseBody = json.decode(response.body);

    final diecieLottoModel = DiecieLottoModel.fromJson(responseBody);

    response = await client.get(
        Uri.parse('http://vpn.database.it:5238/EuroJackpot?iNumColonne=2'),
        headers: {'content-type': 'application/json'});
    responseBody = json.decode(response.body);
    final euroJackpotModel = EuroJackpotModel.fromJson(responseBody);

    response = await client.get(
        Uri.parse('http://vpn.database.it:5238/MilionDay?iNumColonne=2'),
        headers: {'content-type': 'application/json'});
    responseBody = json.decode(response.body);
    final milionDayModel = MilionDayModel.fromJson(responseBody);

    final HomeSchedinaEntity homeSchedinaEntity = HomeSchedinaEntity(
        superEnalotto: superEnalottoModel,
        euroJackpot: euroJackpotModel,
        miliondDay: milionDayModel,
        diecieLotto: diecieLottoModel);

    return homeSchedinaEntity;
  }
}
/*
class AdviceRemoteDataSourceImpl implements AdviceRemoteDatasource {
  final http.Client client;

  AdviceRemoteDataSourceImpl({required this.client});

  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    final response = await client.get(
        Uri.parse('https://api.flutter-community.com/api/v1/advice'),
        headers: {'content-type': 'application/json'});
    final responseBody = json.decode(response.body);
    return AdviceModel.fromJson(responseBody);
  }
}
*/
