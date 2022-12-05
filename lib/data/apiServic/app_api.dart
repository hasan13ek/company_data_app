import 'dart:convert';

import 'package:company_data_app/data/models/model_one.dart';
import 'package:company_data_app/data/models/model_two.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as https;

class Apiservic{
  Future<CarModelOne> getAllCarModelOne() async{
    try{
      Response response = await https.get(Uri.parse("https://easyenglishuzb.free.mockoapp.net/companies"));
      if(response.statusCode==200){
        var jsonData = jsonDecode(response.body) as Map<String,dynamic>;
        // var carModelOne = (jsonData as List)?.map((e) => CarModelOne.fromJson(e)).toList()??[];
        // print(carModelOne[0].data[0].carModel);
        return CarModelOne.fromJson(jsonData);
      }else {
        throw Exception();
      }
    }catch(e){
      throw Exception(e);
    }
  }
  Future<CarModelTwo> getAllCarModelTwo(int id) async{
    try{
      Response response = await https.get(Uri.parse("https://easyenglishuzb.free.mockoapp.net/companies/$id"));
      if(response.statusCode==200){
        var jsonData = jsonDecode(response.body) as Map<String,dynamic>;
        return CarModelTwo.fromJson(jsonData);
      }else {
        throw Exception();
      }
    }catch(e){
      throw Exception(e);
    }
  }


}