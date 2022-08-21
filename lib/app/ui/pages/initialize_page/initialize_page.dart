import 'package:ecommercegetxyape/app/controllers/car_controller.dart';
import 'package:ecommercegetxyape/app/ui/pages/car_page/car_page.dart';
import 'package:ecommercegetxyape/app/ui/pages/home_page/home_page.dart';
import 'package:ecommercegetxyape/app/ui/pages/search_page/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/initialize_controller.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class InitializePage extends GetView<InitializeController> {
  CarController carController = Get.put( CarController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InitializeController>(
      init: InitializeController(),
      builder: (_) {
        return Scaffold(
          body: SizedBox.expand(
            child: PageView(
              controller: _.pageController,
              onPageChanged: (index) {
                _.currentIndex.value = index;
              },
              children: [HomePage(), SearchPage()],
            ),
          ),
          bottomNavigationBar: Obx(
            () => BottomNavyBar(
                selectedIndex: _.currentIndex.value,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                backgroundColor: Theme.of(context).accentColor,
                onItemSelected: (value) {
                  _.currentIndex.value = value;
                  _.pageController.animateToPage(value,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
                showElevation: false,
                items: [
                  BottomNavyBarItem(
                      activeColor: Theme.of(context).primaryColor,
                      icon: Icon(
                        Icons.home,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      title: Text(
                        "Inicio",
                        style: Theme.of(context).textTheme.button,
                      )),
                  BottomNavyBarItem(
                      activeColor: Theme.of(context).primaryColor,
                      icon: Icon(
                        Icons.list_alt,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      title: Text(
                        "Lista",
                        style: Theme.of(context).textTheme.button,
                      )),
                ]),
          ),
          floatingActionButton: Stack(children: [
            FloatingActionButton(
              onPressed: () {
                Get.to(CarPage(), transition: Transition.upToDown);
              },
              child: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).scaffoldBackgroundColor,
                size: 30,
              ),
            ),
            Positioned(
              right: 6,
              top: 6,
              child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context).accentColor,
                      ),
                  child: Obx(()=> Text(
                    "${carController.carList.length}",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.button,
                  ))),
            )
          ]),
        );
      },
    );
  }
}
