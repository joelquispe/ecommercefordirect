
import 'package:get/get.dart';
import '../controllers/detailsproduct_controller.dart';


class DetailsproductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsproductController>(() => DetailsproductController());
  }
}