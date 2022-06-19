
import 'package:ecommercegetxyape/app/controllers/car_controller.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';


class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    
  }
}