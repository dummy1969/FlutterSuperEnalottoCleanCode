// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:flutter_superenalotto_cleancode/1_domain/entities/home_schedina_entity.dart';
import 'package:flutter_superenalotto_cleancode/1_domain/failures/failures.dart';
import 'package:flutter_superenalotto_cleancode/1_domain/repositories/home_schedina_repo.dart';

class HomeUseCase {
  final HomeSchedinaRepo homeSchedinaRepo;
  HomeUseCase({
    required this.homeSchedinaRepo,
  });

  Future<Either<Failure, HomeSchedinaEntity>> getEstrazioni() async {
    return homeSchedinaRepo.getAdviceFromDatasource();
    // space for business logic
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
