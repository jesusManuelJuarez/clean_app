
import 'package:clean_app/feature/data/datasorce/transporte_remote_data_source.dart';
import 'package:clean_app/feature/data/repositories/transporte_repository_imp.dart';
import 'package:clean_app/feature/domain/usecases/create_transporte_usecase.dart';
import 'package:clean_app/feature/domain/usecases/delete_transporte_usecase.dart';
import 'package:clean_app/feature/domain/usecases/get_transporte_usecase.dart';
import 'package:clean_app/feature/domain/usecases/update_transporte_usecase.dart';

class UsecaseConfig{
  TransporteRepositoryImpl? transporteRepositoryImpl;
  TransporteRemoteDataSourceImp? transporteRemoteDataSourceImp;

  GetTransporteUsecase? getTransporteUsecase;
  CreateTransporteUsecase? createTransporteUsecase;
  DeleteTransporteUsecase? deleteTransporteUsecase;
  UpdateTransporteUsecase? updateTransporteUsecase;

  UsecaseConfig(){
    transporteRemoteDataSourceImp = TransporteRemoteDataSourceImp();
    transporteRepositoryImpl = TransporteRepositoryImpl(transporteRemoteDataSource: transporteRemoteDataSourceImp!); 

    getTransporteUsecase = GetTransporteUsecase(transporteRepositoryImpl!);
    createTransporteUsecase = CreateTransporteUsecase( transporteRepositoryImpl!);
    deleteTransporteUsecase = DeleteTransporteUsecase(transporteRepositoryImpl!);
    updateTransporteUsecase = UpdateTransporteUsecase(transporteRepository: transporteRepositoryImpl!);
  }

}