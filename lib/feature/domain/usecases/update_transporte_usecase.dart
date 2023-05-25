import 'package:clean_app/feature/domain/entities/transporte.dart';

import '../repositories/transporte_repository.dart';

class UpdateTransporteUsecase{
  final TransporteRepository transporteRepository;

  UpdateTransporteUsecase({required this.transporteRepository});

  Future<void> execute(Transporte transporte)async{
    return await transporteRepository.updateTransporte(transporte);
  }
}