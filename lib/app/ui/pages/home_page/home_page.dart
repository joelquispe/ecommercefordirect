import 'package:ecommercegetxyape/app/controllers/car_controller.dart';
import 'package:ecommercegetxyape/app/data/data.dart';
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
                        height: Get.height / 3,
                        child: CarouselSlider(
                            items: comidas
                                .map((e) => Container(
                                      child: Image.asset("${e.img}"),
                                    ))
                                .toList(),
                            options: CarouselOptions(
                              viewportFraction: 0.7,
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
                        color: Theme.of(context).primaryColor,
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
                                child: Text("Sandwich",
                                    style:
                                        Theme.of(context).textTheme.headline2)),
                            cardProduct(_, context, carController)
                          ],
                        ),
                      ),
                      Container(
                        child: Image.asset(
                          "assets/gif/food.gif",
                          height: 150,
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        color: Theme.of(context).primaryColor,
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
                                child: Text("Anticuchos",
                                    style:
                                        Theme.of(context).textTheme.headline2)),
                           cardProduct(_, context, carController)
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        color: Theme.of(context).primaryColor,
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
                                child: Text("Dulces",
                                    style:
                                        Theme.of(context).textTheme.headline2)),
                            cardProduct(_, context, carController)
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
