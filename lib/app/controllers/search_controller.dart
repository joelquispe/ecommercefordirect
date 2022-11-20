import 'package:ecommercegetxyape/app/controllers/car_controller.dart';
import 'package:ecommercegetxyape/app/data/data.dart';
import 'package:ecommercegetxyape/app/data/models/Product.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  List<Product> filterFoods = comidas;
  CarController conCart = Get.put<CarController>( CarController());
  void search(String input) {
    final products = comidas.where((element) {
      return element.name!.contains(input);
    }).toList();

    filterFoods = products;
    update();
  }
}
