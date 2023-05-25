import 'package:clean_app/feature/domain/entities/transporte.dart';

class TransporteModel extends Transporte {
  TransporteModel({
    required String nombreEmpresa,
    required String trasmision,
    required String ac,
    required String numAsientos,
    required String modelo,
    required String precio,
    required String detalles,
    required String disponible,
    required String id,
  }) : super(
          nombreEmpresa: nombreEmpresa,
          trasmision: trasmision,
          ac: ac,
          numAsientos: numAsientos,
          modelo: modelo,
          precio: precio,
          detalles: detalles,
          disponible: disponible,
          id: id,
        );

  factory TransporteModel.fromJson(Map<String,dynamic> json){
    return TransporteModel(
      nombreEmpresa: json['nombreEmpresa'],
      trasmision: json['transmision'],
      ac: json['ac'],
      numAsientos: json['numAsientos'],
      modelo: json['modelo'],
      precio: json['precio'],
      detalles: json['detalles'],
      disponible: json['disponible'],
      id: json['id'].toString(),
    );
  }

  factory TransporteModel.fromEntity(Transporte transporte) {
    return TransporteModel(
      nombreEmpresa: transporte.nombreEmpresa,
      trasmision: transporte.trasmision,
      ac: transporte.ac,
      numAsientos: transporte.numAsientos,
      modelo: transporte.modelo,
      precio: transporte.precio,
      detalles: transporte.detalles,
      disponible: transporte.disponible,
      id: transporte.id,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'nombreEmpresa': nombreEmpresa,
      'transmision': trasmision,
      'ac': ac,
      'numAsientos': numAsientos,
      'modelo': modelo,
      'precio': precio,
      'detalles': detalles,
      'disponible': disponible
    };
  }
}
