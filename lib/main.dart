import 'package:company_data_app/data/apiServic/app_api.dart';
import 'package:company_data_app/data/repositories/app_repository.dart';
import 'package:company_data_app/ui/screens/home_page.dart';
import 'package:company_data_app/viewmodel/car_companies_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  AppRepository appRepository = AppRepository(apiservic: Apiservic());
  CarCompaniesViewModel carCompaniesViewModel = CarCompaniesViewModel(appRepository: appRepository);
  runApp(
    MultiProvider(
  providers:  [
    ChangeNotifierProvider(create:(_)=> carCompaniesViewModel)
  ],
  child: MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

