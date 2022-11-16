part of 'home_cubit.dart';

abstract class HomeCubitState extends Equatable {
  const HomeCubitState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeCubitState {}

class HomeLoading extends HomeCubitState {}

class HomeLoaded extends HomeCubitState {
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

class HomeError extends HomeCubitState {
  final String errorMessage;
  const HomeError({
    required this.errorMessage,
  });
}
