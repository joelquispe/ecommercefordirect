import 'package:ecommercegetxyape/app/controllers/car_controller.dart';
import 'package:ecommercegetxyape/app/controllers/home_controller.dart';
import 'package:ecommercegetxyape/app/ui/pages/detailsproduct_page/detailsproduct_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

Widget cardProduct(
    HomeController _, BuildContext context, CarController carController) {
  return Container(
    height: 240,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: _.comidass.length,
        itemBuilder: (context, index) {
          return Card(
            color: Theme.of(context).scaffoldBackgroundColor,
            elevation: 7,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: [
                    GestureDetector(
                      onLongPress: () {
                        Get.to(DetailsproductPage(),
                            transition: Transition.zoom,arguments: _.comidass[index]);
                      },
                      child: Image.asset(
                        "${_.comidass[index].img}",
                        height: 100,
                      ),
                    ),
                    Text(
                      "${_.comidass[index].name}",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      "${_.comidass[index].description}",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      "Precio: S/ ${_.comidass[index].price}",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print("agregado");
                        carController.carList.add(_.comidass[index]);
                        carController.calculateSubtotal();
                        carController.calculateTotal();
                        Fluttertoast.showToast(
                            msg: "Agregado al carrito",
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Theme.of(context).accentColor,
                            textColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            fontSize: 16.0);
                        print(carController.carList);
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
          );
        }),
  );
}
