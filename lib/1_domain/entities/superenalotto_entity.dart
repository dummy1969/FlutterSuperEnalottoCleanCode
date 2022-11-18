import 'package:equatable/equatable.dart';

class SuperEnalottoEntity extends Equatable {
  final List<String> estrazioni;
  final String getStar;
  const SuperEnalottoEntity({
    required this.estrazioni,
    required this.getStar,
  });

  @override
  List<Object?> get props => [];
}
