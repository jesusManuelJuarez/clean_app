part of 'transporte_bloc.dart';
@immutable
abstract class TransporteState {}

class Loading extends TransporteState {}

class Loaded extends TransporteState {
  final List<Transporte> transporte;
  Loaded({required this.transporte});
}
class Error extends TransporteState{
  final String error;

  Error({required this.error});
}