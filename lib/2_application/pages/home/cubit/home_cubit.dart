import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_superenalotto_cleancode/1_domain/usecases/home_usecase.dart';

import '../../../../1_domain/failures/failures.dart';

part 'home_state.dart';

const generalFailureMessage = 'Ops, something gone wrong. Please try again!';
const serverFailureMessage = 'Ops, API Error. please try again!';
const cacheFailureMessage = 'Ops, chache failed. Please try again!';

class HomeCubit extends Cubit<HomeCubitState> {
  final HomeUseCase homeUseCase;
  HomeCubit({required this.homeUseCase}) : super(HomeInitial());

  void estrazioniRequested() async {
    emit(HomeLoading());
    //genera nuove estrazioni
    debugPrint(
        'ora devi recuperare nuove estrazioni dalla business logic sottostante nel modello');
    final failureOrEstrazione = await homeUseCase.getEstrazioni();
    failureOrEstrazione.fold(
        (failure) =>
            emit(HomeError(errorMessage: _mapFailureToMessage(failure))),
        (estrazione) => emit(HomeLoaded(
            estrazioniSupernalotto: estrazione.superEnalotto.estrazioni,
            getStar: estrazione.superEnalotto.getStar,
            estrazioniMilionDay: estrazione.miliondDay.estrazioni,
            estrazioniDiecielotto: estrazione.diecieLotto.estrazioni,
            estrazioniEuroJackpot: estrazione.euroJackpot.estrazioni,
            get10: estrazione.euroJackpot.get10)));

    debugPrint('estrazioni generate');
  }
  /*emit(const HomeLoaded(
        estrazioniSupernalotto: ['estrazioniSupernalotto'],
        estrazioniMilionDay: ['estrazioniMilionDay'],
        estrazioniEuroJackpot: ['estrazioniEuroJackpot'],
        estrazioniDiecielotto: ['estrazioniDiecielotto'],
        get10: 'get10',
        getStar: 'getStar'));
*/
  //emit(const HomeError(errorMessage: 'errorMessage'));

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
