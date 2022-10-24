
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../controllers/splash_controller.dart';


class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${controller.title}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27),),
              Lottie.asset("assets/img/shop.json",height: 200)
            ],
          ),
        )
      ),
    );
  }
}
  