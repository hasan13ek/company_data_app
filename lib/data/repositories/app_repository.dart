import 'package:company_data_app/data/apiServic/app_api.dart';
import 'package:company_data_app/data/models/model_one.dart';
import 'package:company_data_app/data/models/model_two.dart';

class AppRepository{
  AppRepository({required Apiservic apiservic}){
    _apiservic = apiservic;
  }
  late Apiservic _apiservic;

  Future<CarModelOne> getAllDataOne()=>_apiservic.getAllCarModelOne();

  Future<CarModelTwo> getAllDataTwo({required int id})=>_apiservic.getAllCarModelTwo(id);

}