import 'package:ecommercegetxyape/app/data/data.dart';
import 'package:ecommercegetxyape/app/data/models/Product.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Product> get comidass => comidas;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
