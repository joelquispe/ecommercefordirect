import 'package:ecommercegetxyape/app/controllers/car_controller.dart';
import 'package:ecommercegetxyape/app/controllers/home_controller.dart';
import 'package:ecommercegetxyape/app/controllers/search_controller.dart';
import 'package:get/get.dart';
import '../controllers/initialize_controller.dart';

class InitializeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitializeController>(() => InitializeController());
    Get.put(HomeController());
    
    Get.put(SearchController());
  }
}
