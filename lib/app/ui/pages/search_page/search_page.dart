import 'package:ecommercegetxyape/app/data/data.dart';
import 'package:ecommercegetxyape/app/ui/pages/detailsproduct_page/detailsproduct_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/search_controller.dart';

class SearchPage extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
        init: SearchController(),
        builder: (_) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Container(
                        child: TextField(
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelStyle: TextStyle(
                                  color: Theme.of(context).accentColor),
                              labelText: "Buscar...",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              prefixIcon: Icon(Icons.search)),
                          onChanged: (value) {},
                        ),
                      ),
                      Container(
                        height: Get.height,
                        child: Obx(() => ListView.builder(
                            itemCount: _.filterFoods.length,
                            itemBuilder: (context, index) {
                              var listcomidas = _.filterFoods[index];
                              return GestureDetector(
                                onTap: (){
                                  Get.to(DetailsproductPage(),
                            transition: Transition.zoom,
                            arguments: listcomidas);
                                },
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    color: Theme.of(context).primaryColor,
                                    elevation: 9,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Theme.of(context).scaffoldBackgroundColor),
                                      height: 110,
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.asset(
                                                  "assets/img/foods/comidai.jpg",
                                                  height: 120,
                                                )),
                                          ),
                                          Container(
                                            width: Get.width /2,
                                            child: Column(
                                              
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("${listcomidas.name}",style:Theme.of(context).textTheme.headline2),
                                                
                                                Text("Precio : ${listcomidas.price}",style:Theme.of(context).textTheme.headline1),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              );
                            })),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
