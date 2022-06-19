import 'package:ecommercegetxyape/app/data/data.dart';
import 'package:ecommercegetxyape/app/data/models/comida.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Comida> get comidass => comidas;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
