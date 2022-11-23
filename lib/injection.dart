import 'package:flutter_superenalotto_cleancode/0_data/datasources/homeschedina_datasource.dart';
import 'package:flutter_superenalotto_cleancode/0_data/repositories/home_schedina_repo_impl.dart';
import 'package:flutter_superenalotto_cleancode/1_domain/repositories/home_schedina_repo.dart';
import 'package:flutter_superenalotto_cleancode/1_domain/usecases/home_usecase.dart';
import 'package:flutter_superenalotto_cleancode/2_application/pages/home/cubit/home_cubit.dart';

import 'package:get_it/get_it.dart';

final sl = GetIt.I; // sl == Service Locator

Future<void> init() async {
// ! application Layer
  // Factory = every time a new/fresh instance of that class
  sl.registerFactory(() => HomeCubit(homeUseCase: sl()));

// ! domain Layer
  sl.registerFactory(() => HomeUseCase(homeSchedinaRepo: sl()));

// ! data Layer

  sl.registerFactory<HomeSchedinaRepo>(
      () => HomeSchedinaRepoImpl(homeSchedinaDatasource: sl()));

  sl.registerFactory<HomeSchedinaDatasource>(
      () => HomeSchedinaLocalSourceImpl());

// ! externs
// per ora non li uso
//  sl.registerFactory(() => http.Client());
}
