import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeInitial());

  void estrazioniRequested() async {
    emit(HomeLoading());
    //genera nuove estrazioni
    debugPrint(
        'ora devi recuperare nuove estrazioni dalla business logic sottostante nel modello');
    await Future.delayed(const Duration(seconds: 1));
    debugPrint('estrazioni generate');
    emit(const HomeLoaded(
        estrazioniSupernalotto: ['estrazioniSupernalotto'],
        estrazioniMilionDay: ['estrazioniMilionDay'],
        estrazioniEuroJackpot: ['estrazioniEuroJackpot'],
        estrazioniDiecielotto: ['estrazioniDiecielotto'],
        get10: 'get10',
        getStar: 'getStar'));

    //emit(const HomeError(errorMessage: 'errorMessage'));
  }
}
