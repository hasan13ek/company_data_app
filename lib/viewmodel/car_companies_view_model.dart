import 'package:company_data_app/data/models/model_one.dart';
import 'package:company_data_app/data/models/model_two.dart';
import 'package:company_data_app/data/repositories/app_repository.dart';
import 'package:flutter/cupertino.dart';

class CarCompaniesViewModel extends ChangeNotifier{

  CarCompaniesViewModel({required AppRepository appRepository}){
    _appRepository = appRepository;
    fetchAllCarModelOne();
  }

  late AppRepository _appRepository;

  bool isLoading = false;

  // List<CarModelOne>? carModelOne;
  CarModelTwo? carModelTwo;
  CarModelOne? carModelOne;

  fetchAllCarModelOne() async {
    notify(true);
    carModelOne = await _appRepository.getAllDataOne();
    notify(false);
  }

  fetchAllCarModelTwo({required int id}) async {
    notify(true);
    carModelTwo = await _appRepository.getAllDataTwo(id:id);
    notify(false);
  }

  notify(bool v){
    isLoading = v;
    notifyListeners();
  }
}