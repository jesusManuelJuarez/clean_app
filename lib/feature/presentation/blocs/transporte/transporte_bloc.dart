// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:clean_app/feature/domain/entities/transporte.dart';
import 'package:clean_app/feature/domain/usecases/delete_transporte_usecase.dart';
import 'package:clean_app/feature/domain/usecases/get_transporte_usecase.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
part 'transporte_event.dart';
part 'transporte_state.dart';


class TransporteBloc extends Bloc<TransporteEvent,TransporteState>{
  final GetTransporteUsecase getTransporteUsecase;
  final DeleteTransporteUsecase deleteTransporteUsecase;

  TransporteBloc({required this.getTransporteUsecase, required this.deleteTransporteUsecase}):super(Loading()){
    on<TransporteEvent>((event,emit) async {
      if(event is GetTransporte){
        try{
          List<Transporte> response = await getTransporteUsecase.execute();
          emit(Loaded(transporte:response ));
        }catch(e){
          emit(Error(error: e.toString()));
        }
      }else if(event is PressDeleteUserButton){
        try{
          emit(DeleteingTransporte());
          await deleteTransporteUsecase.execute(event.id);
          emit(TransporteDeleted()); 
        }catch (e) {
          emit(ErrorDeletingTransporte(error: e.toString()));
        }
      }
    });
  }
  
}