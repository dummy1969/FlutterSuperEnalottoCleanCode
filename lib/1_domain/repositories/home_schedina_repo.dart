import 'package:flutter_superenalotto_cleancode/1_domain/entities/home_schedina_entity.dart';
import 'package:dartz/dartz.dart';

import '../failures/failures.dart';

abstract class HomeSchedinaRepo {
  Future<Either<Failure, HomeSchedinaEntity>> getAdviceFromDatasource();
}
