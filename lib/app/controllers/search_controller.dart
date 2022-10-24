
import 'package:ecommercegetxyape/app/data/data.dart';
import 'package:ecommercegetxyape/app/data/models/Product.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  List<Product> get filterFoods  => comidas.obs;
}
  