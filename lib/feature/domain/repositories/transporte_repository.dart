import 'package:clean_app/feature/domain/entities/transporte.dart';


abstract class TransporteRepository{
  Future<List<Transporte>> getTransporte();
  Future<void>createTransporte(Transporte transporte);
  Future<void>deleteTransporte(String id);
  Future<void>updateTransporte(Transporte transporte);
}