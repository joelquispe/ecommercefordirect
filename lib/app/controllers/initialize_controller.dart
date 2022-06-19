import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class InitializeController extends GetxController {
  RxInt currentIndex = 0.obs;

  late PageController pageController;
  @override
  void onInit() {
    // TODO: implement onInit
    pageController = PageController();
    
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }
}
