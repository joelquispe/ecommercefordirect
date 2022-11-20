import 'package:ecommercegetxyape/app/ui/pages/pay_page/pay_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Theme.of(context).accentColor,
                          ),
                          iconSize: 25),
                      Center(
                        child: Container(
                          height: Get.height / 1.7,
                          child: Obx(() => ListView.builder(
                              itemCount: _.carList.length,
                              itemBuilder: (context, index) {
                                var car = _.carList[index];
                                return Dismissible(
                                  background: Container(
                                    color: Colors.green,
                                    child: Icon(Icons.check),
                                  ),
                                  secondaryBackground: Container(
                                    color: Colors.red,
                                    child: Icon(Icons.delete),
                                  ),
                                  onDismissed: (direction) {
                                    if (direction ==
                                        DismissDirection.endToStart) {
                                      _.carList.removeAt(index);
                                      _.calculateSubtotal();
                                      _.calculateTotal();
                                    } else {}
                                  },
                                  key: ValueKey("dismissCar"),
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      elevation: 9,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        height: 110,
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child: Image.asset(
                                                    "${car.product!.img}",fit: BoxFit.cover,
                                                    height: 120,width: Get.width/3.5,
                                                  )),
                                            ),
                                            Container(
                                              width: Get.width / 2,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text("${car.product!.name}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline2),
                                                  Text(
                                                      "Cantidad : ${car.cantidad}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline1),
                                                  Text(
                                                      "Precio : S/${car.product!.price}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline1),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                );
                              })),
                        ),
                      ),
                      Container(
                        child: Obx(()=> Column(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              color: Theme.of(context).accentColor,
                              elevation: 9,
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Subtotal: ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    Text("S/${_.subtotal.value}",
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
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Delivery: ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    Text("S/"+"${_.delivery}",
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
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Total: ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    Text("${_.total.value}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Obx(() => Radio(
                                      value: "bcp",
                                      groupValue: _.methodpay.value,
                                      onChanged: (value) {
                                        _.methodpay.value = value!.toString();
                                      })),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.asset(
                                      "assets/img/pays/bcp.png",
                                      height: 30,
                                    ),
                                  ),
                                  Obx(() => Radio(
                                      value: "interbank",
                                      groupValue: _.methodpay.value,
                                      onChanged: (value) {
                                        _.methodpay.value = value!.toString();
                                      })),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.asset(
                                      "assets/img/pays/interbank.png",
                                      height: 30,
                                    ),
                                  ),
                                  Obx(() => Radio(
                                      value: "plin",
                                      groupValue: _.methodpay.value,
                                      onChanged: (value) {
                                        _.methodpay.value = value!.toString();
                                      })),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.asset(
                                      "assets/img/pays/plin.png",
                                      height: 30,
                                    ),
                                  ),
                                  Obx(() => Radio(
                                      value: "yape",
                                      groupValue: _.methodpay.value,
                                      onChanged: (value) {
                                        _.methodpay.value = value!.toString();
                                      })),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.asset(
                                      "assets/img/pays/yape.png",
                                      height: 30,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (_.carList.isNotEmpty) {
                                  Get.to(PayPage(),
                                      transition: Transition.size,
                                      arguments: [_.carList, _.methodpay]);
                                } else {
                                  Fluttertoast.showToast(
                                      fontSize: 20,
                                      textColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      backgroundColor:
                                          Theme.of(context).accentColor,
                                      gravity: ToastGravity.CENTER,
                                      msg: "Carrito de compras vacío");
                                }
                              },
                              child: Text(
                                "Proceder a comprar",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            )
                          ],
                        ),)
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
