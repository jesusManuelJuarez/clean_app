part of 'transportes_bloc.dart';

@immutable
abstract class TransportesState {}

class TransporteInitial extends TransportesState{}

class SavingTransportes extends TransportesState{}
class TransportesSaved extends TransportesState{}
class ErrorSavingTransportes extends TransportesState{
  final String message;

  ErrorSavingTransportes({required this.message});
}