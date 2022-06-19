
import 'package:ecommercegetxyape/app/data/data.dart';
import 'package:ecommercegetxyape/app/data/models/comida.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  List<Comida> get filterFoods  => comidas.obs;
}
  