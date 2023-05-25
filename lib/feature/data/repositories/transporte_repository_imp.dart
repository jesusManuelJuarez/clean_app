import 'package:clean_app/feature/data/datasorce/transporte_remote_data_source.dart';
import 'package:clean_app/feature/domain/entities/transporte.dart';
import 'package:clean_app/feature/domain/repositories/transporte_repository.dart';

class TransporteRepositoryImpl implements TransporteRepository{
  final TransporteRemoteDataSource transporteRemoteDataSource;

  TransporteRepositoryImpl({required this.transporteRemoteDataSource});

  @override
  Future<List<Transporte>> getTransporte() async {
    return await transporteRemoteDataSource.getTransporte();
  }
  
  @override
  Future<void> createTransporte(Transporte transporte) async{
    return await transporteRemoteDataSource.createTransporte(transporte);
  }
  
  @override
  Future<void> deleteTransporte(String id) async {
    return await transporteRemoteDataSource.deleteTransporte(id);
  }

  @override
  Future<void>updateTransporte(Transporte transporte) async{
    return await transporteRemoteDataSource.updateTransporte(transporte);
  } 
}