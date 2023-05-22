
import 'package:clean_app/feature/data/datasorce/transporte_remote_data_source.dart';
import 'package:clean_app/feature/data/repositories/transporte_repository_imp.dart';
import 'package:clean_app/feature/domain/usecases/get_transporte_usecase.dart';

class UsecaseConfig{
  GetTransporteUsecase? getTransporteUsecase;
  TransporteRepositoryImpl? transporteRepositoryImpl;
  TransporteRemoteDataSourceImp? transporteRemoteDataSourceImp;

  UsecaseConfig(){
    transporteRemoteDataSourceImp = TransporteRemoteDataSourceImp();
    transporteRepositoryImpl = TransporteRepositoryImpl(transporteRemoteDataSource: transporteRemoteDataSourceImp!); 
    getTransporteUsecase = GetTransporteUsecase(transporteRepositoryImpl!);
  }

}