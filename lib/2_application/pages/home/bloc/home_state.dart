// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<String> estrazioniSupernalotto;
  final String? getStar;
  final List<String> estrazioniMilionDay;
  final List<String> estrazioniEuroJackpot;
  final List<String> estrazioniDiecielotto;
  final String? get10;

  const HomeLoaded({
    required this.estrazioniSupernalotto,
    this.getStar,
    required this.estrazioniMilionDay,
    required this.estrazioniEuroJackpot,
    required this.estrazioniDiecielotto,
    this.get10,
  });
}

class HomeError extends HomeState {
  final String errorMessage;
  const HomeError({
    required this.errorMessage,
  });
}
