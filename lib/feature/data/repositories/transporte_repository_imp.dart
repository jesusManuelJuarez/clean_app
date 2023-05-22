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
  
}