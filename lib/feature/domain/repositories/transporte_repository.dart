import 'package:clean_app/feature/domain/entities/transporte.dart';

abstract class TransporteRepository{
  Future<List<Transporte>> getTransporte();
}