import 'package:clean_app/feature/domain/entities/transporte.dart';
import 'package:clean_app/feature/domain/repositories/transporte_repository.dart';

class GetTransporteUsecase{
  final TransporteRepository transporteRepository;
  GetTransporteUsecase(this.transporteRepository);
  Future<List<Transporte>> execute() async{
    return await transporteRepository.getTransporte();
  }
}