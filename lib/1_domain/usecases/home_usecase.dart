import 'package:flutter_superenalotto_cleancode/1_domain/entities/diecielotto_entity.dart';
import 'package:flutter_superenalotto_cleancode/1_domain/entities/eurojackpot_entity.dart';
import 'package:flutter_superenalotto_cleancode/1_domain/entities/home_schedina_entity.dart';
import 'package:flutter_superenalotto_cleancode/1_domain/entities/milionday_entity.dart';
import 'package:flutter_superenalotto_cleancode/1_domain/entities/superenalotto_entity.dart';
import 'package:flutter_superenalotto_cleancode/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class HomeUseCase {
  Future<Either<Failure, HomeSchedinaEntity>> getEstrazioni() async {
    //TODO dovrò poi passare attraverso il repository -> e quindi il data source per recuperare l'estrazione
    // mi chiedo però se iColonne lo devo 'passare' qui oppure è il repository che si preoccupa di
    // call a repository to get data (failure or data)
    // proceed with business logic (manipulate the data)
    await Future.delayed(const Duration(seconds: 1), () {});
    // call to repo went good:  -> return data not failure
    // return right(const AdviceEntity(advice: 'advice to test', id: 1));
    return right(HomeSchedinaEntity(
        superEnalotto: const SuperEnalottoEntity(
            estrazioni: ['01-02-03-04-05-06', '07-08-09-10-11-12'],
            getStar: '10'),
        miliondDay: const MilionDayEntity(
            estrazioni: ['01-02-03-04-05-06', '07-08-09-10-11-12']),
        diecieLotto: const DieciELottoEntity(
            estrazioni: ['01-02-03-04-05-06', '07-08-09-10-11-12']),
        euroJackpot: const EuroJackpotEntity(
            estrazioni: ['01-02-03-04-05-06', '07-08-09-10-11-12'])));

    // call to repo went bad or logic had an error -> return failure (left side)

    //return left(CacheFailure());
  }
}

/*
class AdviceUseCases {
  Future<Either<Failure,AdviceEntity>> getAdvice() async {
    // call a repository to get data (failure or data)
    // proceed with business logic (manipulate the data)
    await Future.delayed(const Duration(seconds: 3), () {});
    // call to repo went good:  -> return data not failure
    // return right(const AdviceEntity(advice: 'advice to test', id: 1));
    // call to repo went bad or logic had an error -> return failure (left side)
     return left(CacheFailure());
  }
}
*/
