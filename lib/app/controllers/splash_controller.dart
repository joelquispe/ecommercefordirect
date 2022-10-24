import 'package:ecommercegetxyape/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  String title = "Ecommerce Direct";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("joel");
    
    Future.delayed(Duration(seconds: 4), () => {Get.offAndToNamed(Routes.INITIAL)});
  }
}
