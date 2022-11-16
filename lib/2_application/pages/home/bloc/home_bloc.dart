import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<EstrazioniRequestedEvent>((event, emit) async {
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
    });
  }
}
