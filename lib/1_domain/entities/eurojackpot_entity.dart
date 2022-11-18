import 'package:equatable/equatable.dart';

class EuroJackpotEntity extends Equatable {
  final List<String>? estrazioni;
  final String get10;
  const EuroJackpotEntity({required this.estrazioni, required this.get10});

  @override
  List<Object?> get props => [];
}
