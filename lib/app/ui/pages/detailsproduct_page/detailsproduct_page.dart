import 'package:ecommercegetxyape/app/controllers/car_controller.dart';
import 'package:ecommercegetxyape/app/data/models/product_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../controllers/detailsproduct_controller.dart';

class DetailsproductPage extends GetView<DetailsproductController> {
  final carController = Get.put(CarController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsproductController>(
        init: DetailsproductController(),
        builder: (_) {
          ProductOrder productOrder = new ProductOrder();
          productOrder.product = controller.comida;
          RxInt canti = 1.obs;
          return Scaffold(
            body: SafeArea(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: Get.height),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back_ios_new),
                        color: Theme.of(context).accentColor,
                      ),
                      Image.asset("assets/img/foods/comidai.jpg", height: 250),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${_.comida.name}",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${_.comida.description}",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Spacer(),
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Precio :",
                                style: Theme.of(context).textTheme.headline2),
                            Text("S/ ${_.comida.price! * canti.value}",
                                style: Theme.of(context).textTheme.headline2),
                          ],
                        ),
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        IconButton(
                            onPressed: () {
                              canti.value--;
                            },
                            icon: FaIcon(FontAwesomeIcons.minus)),
                        Obx(
                          () => Text(
                            "${canti.value}",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              canti.value++;
                            },
                            icon: FaIcon(FontAwesomeIcons.plus))
                      ]),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(Get.width, 40)),
                            onPressed: () {
                              productOrder.cantidad = canti.value;
                              carController.carList.add(productOrder);
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
                              Get.back();
                            },
                            icon: Icon(Icons.add),
                            label: Text("Agregar",
                                style:
                                    Theme.of(context).textTheme.labelMedium)),
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
