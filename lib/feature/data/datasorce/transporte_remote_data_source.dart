import 'package:clean_app/feature/data/models/transporte_model.dart';
import 'package:clean_app/feature/domain/entities/transporte.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

abstract class TransporteRemoteDataSource {
  Future<List<TransporteModel>> getTransporte();
  Future<void> createTransporte(Transporte transporte);
  Future<void> deleteTransporte(String id);
  Future<void> updateTransporte(Transporte transporte);
}

class TransporteRemoteDataSourceImp implements TransporteRemoteDataSource {
  @override
  Future<List<TransporteModel>> getTransporte() async {
    var url =
        Uri.parse('https://orca-app-dmtw4.ondigitalocean.app/api/transportes');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<TransporteModel> data = convert
          .jsonDecode(response.body)
          .map<TransporteModel>((data) => TransporteModel.fromJson(data))
          .toList();

      return data;
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<void> createTransporte(Transporte transporte) async {
    var transportemodelEntity = TransporteModel.fromEntity(transporte);
    var body = convert.jsonEncode(transportemodelEntity);
    var url =
        Uri.parse('https://orca-app-dmtw4.ondigitalocean.app/api/transportes');
    await http.post(url, body: body, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
  }

  @override
  Future<void> deleteTransporte(String id) async {
    var url = Uri.parse(
        'https://orca-app-dmtw4.ondigitalocean.app/api/transportes/$id');
    await http.delete(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
  }

  @override
  Future<void> updateTransporte(Transporte transporte) async {
    String id = transporte.id;
    var transportemodelEntity = TransporteModel.fromEntity(transporte);
    var body = convert.jsonEncode(transportemodelEntity);
    var url = Uri.parse(
        'https://orca-app-dmtw4.ondigitalocean.app/api/transportes/$id');
    var response = await http.put(url, body: body, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    debugPrint("${response.statusCode.toString()} ${transporte.id}");
  }
}
