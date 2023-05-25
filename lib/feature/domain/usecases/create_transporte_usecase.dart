import '../entities/transporte.dart';
import '../repositories/transporte_repository.dart';

class CreateTransporteUsecase{
  final TransporteRepository transporteRepository;
  CreateTransporteUsecase( this.transporteRepository);

  Future<void> execute(Transporte transporte) async {
    return await transporteRepository.createTransporte(transporte);
  }

}