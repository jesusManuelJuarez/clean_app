import 'package:clean_app/feature/domain/usecases/create_transporte_usecase.dart';
import 'package:clean_app/feature/domain/usecases/update_transporte_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/transporte.dart';
part 'transportes._event.dart';
part 'transportes_state.dart';
class TransportesBloc extends Bloc<TransportesEvent,TransportesState>{
  final CreateTransporteUsecase createTransporteUsecase;
  final UpdateTransporteUsecase updateTransporteUsecase;

  TransportesBloc({required this.createTransporteUsecase, required this.updateTransporteUsecase}):super(TransporteInitial()){
    on<TransportesEvent>((event, emit)async {
      if(event is PressCreateTransportesButton){
        try {
          emit(SavingTransportes());
          await createTransporteUsecase.execute(event.transporte);
          emit(TransportesSaved());
        } catch (e) {
          emit(ErrorSavingTransportes(message: e.toString()));
        }
      }else if(event is PressUpdateTransportesButton){
        try {
          emit(SavingTransportes());
          await updateTransporteUsecase.execute(event.transporte);
          emit(TransportesSaved());
        } catch (e) {
          emit(ErrorSavingTransportes(message: e.toString()));
        }
      }
    });
  }

}