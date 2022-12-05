import 'package:cached_network_image/cached_network_image.dart';
import 'package:company_data_app/ui/screens/info_page.dart';
import 'package:company_data_app/viewmodel/car_companies_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Consumer<CarCompaniesViewModel>(
              builder: (context, carCompaniesViewModel, child) {
                return Center(
                  child: carCompaniesViewModel.isLoading
                      ? const CircularProgressIndicator()
                      : (carCompaniesViewModel.carModelOne == null
                          ? const Text("Hozircha data yuq")
                          : Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 4,right: 0,top: 6),
                                  width: double.infinity,
                                  height: 510,
                                  child: GridView.builder(
                                    gridDelegate:
                                       const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2),
                                    itemCount: 8,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (_)=>InfoPage(id: carCompaniesViewModel.carModelOne!.data[index].id!.toInt(),)));
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.only(top: 4),
                                          margin: const EdgeInsets.only(top: 6,left: 4,right: 4,bottom: 2),
                                          width: 120,
                                          height: 180,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1,color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.white),
                                          child: Column(
                                            children: [
                                              Center(child: Text(carCompaniesViewModel.carModelOne!.data[index].carModel.toString())),
                                            const SizedBox(height: 4,),
                                            Container(width: double.infinity,height: 1,color: Colors.grey,),
                                              Container(
                                                width: double.infinity,
                                                height: 143,
                                                decoration:  BoxDecoration(
                                                  borderRadius:const BorderRadius.only(
                                                      bottomLeft: Radius.circular(12),
                                                    bottomRight: Radius.circular(12)
                                                  ),
                                                  image: DecorationImage(image:
                                                  NetworkImage(
                                                      carCompaniesViewModel.carModelOne!.data[index].logo.toString()),
                                                      fit: BoxFit.fill,scale: 6),
                                                ),
                                              )

                                              // SizedBox(
                                              //   width: double.infinity,
                                              //   height: 143,
                                              //   child: ClipRRect(
                                              //     borderRadius: const BorderRadius.only(
                                              //         topLeft: Radius.circular(12),
                                              //         bottomLeft: Radius.circular(12)),
                                              //     child: CachedNetworkImage(
                                              //       imageUrl: carCompaniesViewModel.carModelOne!.data[index].logo.toString(),
                                              //       fit: BoxFit.fill,
                                              //       placeholder: (context, url) {
                                              //         return Shimmer.fromColors(
                                              //           period: const Duration(seconds: 1),
                                              //           baseColor: Colors.grey.shade300,
                                              //           highlightColor: Colors.grey.shade100,
                                              //           child: Container(
                                              //             width: double.infinity,
                                              //             height: 143,
                                              //             color: Colors.white,
                                              //           ),
                                              //         );
                                              //       },
                                              //       errorWidget: (context, url, error) => const Icon(Icons.error),
                                              //     ),
                                              //   ),
                                              // ),
                                          ],),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            )),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CarCompaniesViewModel>().fetchAllCarModelOne();
        },
        child: const Icon(Icons.download),
      ),
    );
  }
}
