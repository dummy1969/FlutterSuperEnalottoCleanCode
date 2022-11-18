import 'package:equatable/equatable.dart';

class EuroJackpotEntity extends Equatable {
  final List<String>? estrazioni;
  const EuroJackpotEntity({
    required this.estrazioni,
  });

  @override
  List<Object?> get props => [];
}
