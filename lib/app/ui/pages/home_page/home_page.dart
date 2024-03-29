import 'package:ecommercegetxyape/app/controllers/car_controller.dart';
import 'package:ecommercegetxyape/app/data/data.dart';
import 'package:ecommercegetxyape/app/data/models/product_order.dart';
import 'package:ecommercegetxyape/app/ui/pages/home_page/widgets/cardProduct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarController carController = Get.put(CarController());
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: Get.height / 2.5,
                        child: CarouselSlider(
                            items: comidas
                                .map((e) => ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                        child: Image.asset("${e.img}",fit: BoxFit.cover,height: Get.height /2.5,width: Get.width,),
                                      ),
                                ))
                                .toList(),
                            options: CarouselOptions(
                              
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                            )),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                       
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Sandwich",
                                      style:
                                          Theme.of(context).textTheme.headline2),
                                )),
                            cardProduct(_, context, carController,ProductOrder(cantidad: 1),"sandwich")
                          ],
                        ),
                      ),
                      
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Anticuchos",
                                      style:
                                          Theme.of(context).textTheme.headline2),
                                )),
                           cardProduct(_, context, carController,ProductOrder(cantidad: 1),"anticucho")
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Dulces",
                                      style:
                                          Theme.of(context).textTheme.headline2),
                                )),
                            cardProduct(_, context, carController,ProductOrder(cantidad: 1),"postre")
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
