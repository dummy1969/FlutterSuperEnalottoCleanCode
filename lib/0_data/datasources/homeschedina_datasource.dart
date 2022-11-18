import 'package:flutter_superenalotto_cleancode/0_data/models/random.dart';
import 'package:flutter_superenalotto_cleancode/1_domain/entities/diecielotto_entity.dart';
import 'package:flutter_superenalotto_cleancode/1_domain/entities/eurojackpot_entity.dart';
import 'package:flutter_superenalotto_cleancode/1_domain/entities/home_schedina_entity.dart';
import 'package:flutter_superenalotto_cleancode/1_domain/entities/milionday_entity.dart';
import 'package:flutter_superenalotto_cleancode/1_domain/entities/superenalotto_entity.dart';

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
    final superEnalotto = SuperEnalotto(2);
    final milionDay = MilionDay(1);
    final euroJackpot = EuroJackpot(1);
    final lotto = DieciLotto(1);

    final superEnalalottoEntity = SuperEnalottoEntity(
        estrazioni: superEnalotto.estrazioni(),
        getStar: superEnalotto.getStar());
    final milionDayEntity = MilionDayEntity(estrazioni: milionDay.estrazioni());
    final euroJackpotEntity = EuroJackpotEntity(
        estrazioni: euroJackpot.estrazioni(), get10: euroJackpot.get10());
    final lottoEntity = DieciELottoEntity(estrazioni: lotto.estrazioni());

    final homeSchedinaEntity = HomeSchedinaEntity(
        superEnalotto: superEnalalottoEntity,
        euroJackpot: euroJackpotEntity,
        miliondDay: milionDayEntity,
        diecieLotto: lottoEntity);

    return homeSchedinaEntity;
  }
}

class HomeSchedinaRemoteSourceImpl implements HomeSchedinaDatasource {
  /// TODO Classe che finalmente implementa la generazione delle schedine
  /// in questo caso via API

  @override
  Future<HomeSchedinaEntity> getHomeSchedina() {
    // TODO: implement getHomeSchedina da interogazione API
    throw UnimplementedError();
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
