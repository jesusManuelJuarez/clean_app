import 'package:clean_app/feature/data/models/transporte_model.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
abstract class TransporteRemoteDataSource {
  Future<List<TransporteModel>> getTransporte();
}

class TransporteRemoteDataSourceImp implements TransporteRemoteDataSource {
  @override
  Future<List<TransporteModel>> getTransporte() async {
    var url = Uri.parse('https://orca-app-dmtw4.ondigitalocean.app/api/transportes');
    var response = await http.get(url);
    if( response.statusCode == 200){
      return convert.jsonDecode(response.body).map<TransporteModel>((data)=>TransporteModel.fromJson(data)).toList();
    }else{
      throw UnimplementedError();
    }
  }
}
