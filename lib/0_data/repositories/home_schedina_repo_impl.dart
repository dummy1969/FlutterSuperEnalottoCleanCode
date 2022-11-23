import 'package:flutter_superenalotto_cleancode/0_data/datasources/homeschedina_datasource.dart';
import 'package:flutter_superenalotto_cleancode/0_data/exceptions/exception.dart';
import 'package:flutter_superenalotto_cleancode/1_domain/failures/failures.dart';
import 'package:flutter_superenalotto_cleancode/1_domain/entities/home_schedina_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_superenalotto_cleancode/1_domain/repositories/home_schedina_repo.dart';

class HomeSchedinaRepoImpl implements HomeSchedinaRepo {
  final HomeSchedinaDatasource homeSchedinaDatasource;

  HomeSchedinaRepoImpl({required this.homeSchedinaDatasource});

  //TODO  accorgersi che siamo online e che possiamo/dobbiamo andare a prendere il risultato via api
  //una cosa del tipo
  // if (online) {
  //  final HomeSchedinaDatasource homeSchedinaDatasource =
  //    HomeSchedinaRemoteSourceImpl();
  // }

  @override
  Future<Either<Failure, HomeSchedinaEntity>> getAdviceFromDatasource() async {
    try {
      final result = await homeSchedinaDatasource.getHomeSchedina();
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}

/*
class AdviceRepoImpl implements AdviceRepo {
  final AdviceRemoteDatasource adviceRemoteDatasource =
      AdviceRemoteDatasourceImpl();
  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDatasource() async {
    try {
      final result = await adviceRemoteDatasource.getRandomAdviceFromApi();
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
*/

/*
  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDataSource() async {
    final result = await adviceRemoteDatasource.getRandomAdviceFromApi();
    return right(result);
    */
