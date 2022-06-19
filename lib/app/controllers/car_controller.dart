import 'package:ecommercegetxyape/app/data/data.dart';
import 'package:ecommercegetxyape/app/data/models/comida.dart';
import 'package:get/get.dart';

class CarController extends GetxController {
  List<Comida> carList = List<Comida>.empty().obs;

  RxDouble subtotal = 0.0.obs;
  RxDouble total = 0.0.obs;
  double delivery = 10.0;
  void calculateSubtotal() {
    subtotal.value = carList.fold(
        0.0, (sum, item) => sum + double.parse(item.price.toString()));
  }
  void calculateTotal() {
    total.value = subtotal.value + delivery;
  }
}
