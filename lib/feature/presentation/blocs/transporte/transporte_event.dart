part of 'transporte_bloc.dart';

@immutable
abstract class TransporteEvent {}

class GetTransporte extends TransporteEvent{}

class PressDeleteUserButton extends TransporteEvent{
  final String id;
  PressDeleteUserButton({required this.id});
}