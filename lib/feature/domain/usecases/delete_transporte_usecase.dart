import '../repositories/transporte_repository.dart';

class DeleteTransporteUsecase{
  final TransporteRepository transporteRepository;
  DeleteTransporteUsecase( this.transporteRepository);

  Future<void> execute(String id) async {
    return await transporteRepository.deleteTransporte(id);
  }
}