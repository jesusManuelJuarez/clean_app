part of 'transporte_bloc.dart';

@immutable
abstract class TransporteState {
  get er => null;
}

class Loading extends TransporteState {}

class Loaded extends TransporteState {
  final List<Transporte> transporte;
  Loaded({required this.transporte});
}

class Error extends TransporteState {
  final String error;

  Error({required this.error});
}

class DeleteingTransporte extends TransporteState {}

class TransporteDeleted extends TransporteState {}

class ErrorDeletingTransporte extends TransporteState {
  final String error;
  ErrorDeletingTransporte({required this.error});
}
