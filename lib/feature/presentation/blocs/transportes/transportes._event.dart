part of 'transportes_bloc.dart';


@immutable
abstract class TransportesEvent {}

class PressCreateTransportesButton extends TransportesEvent{
  final Transporte transporte;

  PressCreateTransportesButton({required this.transporte});

}
class PressUpdateTransportesButton extends TransportesEvent{
  final Transporte transporte;
  PressUpdateTransportesButton({required this.transporte});

}