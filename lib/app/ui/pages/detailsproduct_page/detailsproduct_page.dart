import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import '../../../controllers/detailsproduct_controller.dart';

class DetailsproductPage extends GetView<DetailsproductController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsproductController>(
        init: DetailsproductController(),
        builder: (_) {
          return Scaffold(
            body: SafeArea(
              child: ConstrainedBox(
                constraints: BoxConstraints(),
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
                      SizedBox(height: 10,),
                      Container(

                        width: Get.width,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10),
                            ),
                        child: Column(
                          children: [
                            Text(
                              "${_.comida.name}",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            SizedBox(height: 10,),
                            Text(
                              "${_.comida.description}",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("Precio :",
                                    style: Theme.of(context).textTheme.headline2),
                                Text("${_.comida.price}",
                                    style: Theme.of(context).textTheme.headline2),
                              ],
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
