import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/car_controller.dart';

class CarPage extends GetView<CarController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarController>(
        init: CarController(),
        builder: (_) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Theme.of(context).accentColor),
                        child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            iconSize: 25),
                      ),
                      Container(
                        height: Get.height /1.7,
                        child: Obx(() => ListView.builder(
                            itemCount: _.carList.length,
                            itemBuilder: (context, index) {
                              var car = _.carList[index];
                              return Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    color: Theme.of(context).primaryColor,
                                    elevation: 9,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Theme.of(context).primaryColor),
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
                                                Text("${car.name}",style:Theme.of(context).textTheme.headline2),
                                                Text(
                                                    "${car.description}",style: Theme.of(context).textTheme.bodyText1,),
                                                Text("Precio : ${car.price}",style:Theme.of(context).textTheme.headline1),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ));
                            })),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              color: Theme.of(context).accentColor,
                              elevation: 9,
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Subtotal: ",
                                      style:
                                          Theme.of(context).textTheme.labelMedium,
                                    ),
                                    Text("${_.subtotal.value}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              color: Theme.of(context).accentColor,
                              elevation: 9,
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Delivery: ",
                                      style:
                                          Theme.of(context).textTheme.labelMedium,
                                    ),
                                    Text("${_.delivery}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              color: Theme.of(context).accentColor,
                              elevation: 9,
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Total: ",
                                      style:
                                          Theme.of(context).textTheme.labelMedium,
                                    ),
                                    Text("${_.total.value}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium),
                                  ],
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Proceder a comprar",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            )
                          ],
                        ),
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
