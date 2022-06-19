

import 'package:ecommercegetxyape/app/routes/app_pages.dart';
import 'package:ecommercegetxyape/app/ui/pages/home_page/home_page.dart';
import 'package:ecommercegetxyape/app/ui/pages/initialize_page/initialize_page.dart';
import 'package:get/get.dart';


abstract class AppPages {

  static final pages = [
    GetPage(name: Routes.INITIAL, page:()=> InitializePage())
  ];
}