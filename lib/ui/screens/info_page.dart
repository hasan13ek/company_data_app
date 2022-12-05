import 'package:company_data_app/viewmodel/car_companies_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  Widget build(BuildContext context) {
    // var carTwo = Provider.of<CarCompaniesViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Info page"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          // height: double.infinity,
          child: Column(
            children: [
              Consumer<CarCompaniesViewModel>(
                  builder: (context, carCompaniesViewModel, child) {
                return Center(
                  child: carCompaniesViewModel.isLoading
                      ? const CircularProgressIndicator()
                      : (carCompaniesViewModel.carModelTwo == null
                          ? const Text("Yuklash tugmasini bosing")
                          : Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 8,right: 6,top: 8,bottom: 4),
                                  width: double.infinity,
                                  // height: 512,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1,color: Colors.grey),
                                          borderRadius: BorderRadius.circular(12),
                                          color: Colors.white
                                        ),
                                        child: Column(
                                          children: [
                                          const SizedBox(height: 8,),
                                          Text(carCompaniesViewModel.carModelTwo!.carModel.toString(),style:const TextStyle(fontSize: 20),),
                                          const SizedBox(height: 14,),
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
                                                    carCompaniesViewModel.carModelTwo!.logo.toString()),
                                                    fit: BoxFit.fill),
                                              ),
                                            )

                                          ],
                                        ),
                                      ),
                                    const  SizedBox(height: 6,),
                                      Container(
                                        padding: const EdgeInsets.only(left: 8,right: 8),
                                        width: double.infinity,
                                        // height: 200,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1,color: Colors.grey),
                                          borderRadius: BorderRadius.circular(12),
                                          color: Colors.white
                                        ),
                                        child: Column(
                                          children: [
                                            const  SizedBox(height: 8,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                               const  Text("birinchi chiqarilgan yili ",style: TextStyle(fontWeight: FontWeight.w700),),
                                                Text(carCompaniesViewModel.carModelTwo!.establishedYear.toString(),style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
                                              ],
                                            ),
                                           const SizedBox(height: 14,),

                                            Container(width: double.infinity,height: 1,color: Colors.grey,),

                                          ]
                                        ),
                                      ),
                                      const  SizedBox(height: 6,),
                                      Container(
                                        padding: const EdgeInsets.only(left: 8,right: 8),
                                        width: double.infinity,
                                        // height: 200,
                                        decoration: BoxDecoration(
                                            border: Border.all(width: 1,color: Colors.grey),
                                            borderRadius: BorderRadius.circular(12),
                                            color: Colors.white
                                        ),
                                        child: Column(
                                            children: [
                                              const  SizedBox(height: 8,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  const  Text("avtomobilning narxi",style: TextStyle(fontWeight: FontWeight.w700),),
                                                  Text("${carCompaniesViewModel.carModelTwo!.averagePrice.toString()} \$",style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
                                                ],
                                              ),
                                              const SizedBox(height: 14,),

                                              Container(width: double.infinity,height: 1,color: Colors.grey,),

                                            ]
                                        ),
                                      ),
                                      const  SizedBox(height: 6,),
                                      Container(
                                        padding: const EdgeInsets.only(left: 8,right: 8,bottom: 4),
                                        width: double.infinity,
                                        // height: 200,
                                        decoration: BoxDecoration(
                                            border: Border.all(width: 1,color: Colors.grey),
                                            borderRadius: BorderRadius.circular(12),
                                            color: Colors.white
                                        ),
                                        child: Column(
                                            children: [
                                              const  SizedBox(height: 8,),
                                              const  Text("avtomobil haqida ma'lumot",style: TextStyle(fontWeight: FontWeight.w700),),
                                              const SizedBox(height: 10,),
                                              Container(width: double.infinity,height: 1,color: Colors.grey,),
                                             const SizedBox(height: 4,),
                                              Text(carCompaniesViewModel.carModelTwo!.description.toString(),style: const TextStyle(fontWeight: FontWeight.w400),),

                                            ]
                                        ),
                                      ),
                                      const  SizedBox(height: 6,),
                                      Container(
                                        padding: const EdgeInsets.only(left: 8,right: 8,bottom: 4),
                                        width: double.infinity,
                                        // height: 200,
                                        decoration: BoxDecoration(
                                            border: Border.all(width: 1,color: Colors.grey),
                                            borderRadius: BorderRadius.circular(12),
                                            color: Colors.white
                                        ),
                                        child: Column(
                                            children: [
                                              const  SizedBox(height: 8,),
                                              const  Text("avtomobilning rasmlari",style: TextStyle(fontWeight: FontWeight.w700),),
                                              const SizedBox(height: 10,),
                                              Container(width: double.infinity,height: 1,color: Colors.grey,),
                                              const SizedBox(height: 4,),
                                              SizedBox(
                                                width: double.infinity,
                                                height: 622,
                                                child: GridView.builder(
                                                  physics:const NeverScrollableScrollPhysics(),
                                                  gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2),
                                                  itemCount: carCompaniesViewModel.carModelTwo!.carPics.length,
                                                  itemBuilder:
                                                      (BuildContext context, int index) {
                                                    return Container(
                                                      margin: const EdgeInsets.only(top: 6,left: 4,right: 4,bottom: 6),
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(width: 1,color: Colors.grey),
                                                          borderRadius:
                                                          BorderRadius.circular(12),
                                                          color: Colors.white),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            width: double.infinity,
                                                            height: 150,
                                                            decoration:  BoxDecoration(
                                                              borderRadius:const BorderRadius.only(
                                                                  bottomLeft: Radius.circular(12),
                                                                  bottomRight: Radius.circular(12),
                                                                topRight: Radius.circular(12),
                                                                topLeft: Radius.circular(12),
                                                              ),
                                                              image: DecorationImage(image:
                                                              NetworkImage(
                                                                  carCompaniesViewModel.carModelTwo!.carPics[index]),
                                                                  fit: BoxFit.fill,scale: 6),
                                                            ),
                                                          )
                                                        ],),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ]
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                  ),
                );
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CarCompaniesViewModel>().fetchAllCarModelTwo(id: id);
        },
        child: const Icon(Icons.download),
      ),
    );
  }
}
