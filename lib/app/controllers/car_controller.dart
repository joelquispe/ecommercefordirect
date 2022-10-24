import 'package:ecommercegetxyape/app/data/data.dart';
import 'package:ecommercegetxyape/app/data/models/Product.dart';
import 'package:ecommercegetxyape/app/data/models/product_order.dart';
import 'package:ecommercegetxyape/app/ui/pages/pay_page/pay_page.dart';
import 'package:get/get.dart';

class CarController extends GetxController {
  List<ProductOrder> carList = List<ProductOrder>.empty().obs;
  RxString methodpay = "".obs;
  RxDouble subtotal = 0.0.obs;
  RxDouble total = 0.0.obs;
  RxInt amount = 0.obs;
  double delivery = 10.0;
  @override
  void onInit() {
    super.onInit();
  }

  void calculateSubtotal() {
    subtotal.value = carList.fold(
        0.0, (sum, item) => (sum + double.parse(item.product!.price.toString())) * item.cantidad!);
  }

  void calculateTotal() {
    total.value = subtotal.value + delivery;
  }

  void amountPlus(int amount) {
    amount++;
    update();
  }

  void amountMinus(int amount) {
    amount--;
    update();
  }
}
