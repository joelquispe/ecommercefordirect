import 'package:ecommercegetxyape/app/controllers/car_controller.dart';
import 'package:ecommercegetxyape/app/controllers/home_controller.dart';
import 'package:ecommercegetxyape/app/data/data.dart';
import 'package:ecommercegetxyape/app/data/models/product_order.dart';
import 'package:ecommercegetxyape/app/ui/pages/detailsproduct_page/detailsproduct_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

Widget cardProduct(HomeController _, BuildContext context,
    CarController carController, ProductOrder productOrder, String categoria) {
  return Container(
    height: 280,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _.comidass.length,
        itemBuilder: (context, index) {
          ProductOrder productOrder = ProductOrder();
          productOrder.product = _.comidass[index];
          productOrder.cantidad = 1;
          RxInt canti = 1.obs;
          return _.comidass[index].category == categoria
              ? Card(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: Get.width / 2.0,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onLongPress: () {
                                Get.to(DetailsproductPage(),
                                    transition: Transition.zoom,
                                    arguments: _.comidass[index]);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  "${_.comidass[index].img}",
                                  height: 100,
                                  width: Get.width,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "${_.comidass[index].name}",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              "S/${_.comidass[index].price}",
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        canti.value--;
                                      },
                                      icon: FaIcon(FontAwesomeIcons.minus)),
                                  Obx(
                                    () => Text(
                                      "${canti.value}",
                                      style:
                                          Theme.of(context).textTheme.headline1,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        canti.value++;
                                      },
                                      icon: FaIcon(FontAwesomeIcons.plus))
                                ]),
                            ElevatedButton(
                              onPressed: () {
                                bool isExist = false;
                                productOrder.cantidad = canti.value;
                                print("agregado");
                                carController.carList.forEach((element) {
                                  if (element.product!.id ==
                                      productOrder.product!.id) {
                                    Fluttertoast.showToast(
                                        msg: "Este producto ya esta agregado",
                                        gravity: ToastGravity.TOP,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor:
                                            Theme.of(context).accentColor,
                                        textColor: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        fontSize: 16.0);
                                    isExist = true;
                                    return;
                                  }
                                });
                                if (isExist == false) {
                                  canti.value = 1;
                                  carController.carList.add(productOrder);
                                  carController.calculateSubtotal();
                                  carController.calculateTotal();
                                  Fluttertoast.showToast(
                                      msg: "Agregado al carrito",
                                      gravity: ToastGravity.TOP,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor:
                                          Theme.of(context).accentColor,
                                      textColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      fontSize: 16.0);
                                  print(carController.carList);
                                }
                              },
                              child: Text(
                                "Agregar",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox();
        }),
  );
}
