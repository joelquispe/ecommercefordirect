
import 'package:get/get.dart';
import '../controllers/pay_controller.dart';


class PayBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PayController>(() => PayController());
  }
}