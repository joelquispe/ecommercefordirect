import 'package:ecommercegetxyape/app/data/data.dart';
import 'package:ecommercegetxyape/app/data/models/product_order.dart';
import 'package:ecommercegetxyape/app/ui/pages/detailsproduct_page/detailsproduct_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../controllers/search_controller.dart';

class SearchPage extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
        init: SearchController(),
        builder: (_) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Container(
                        child: TextField(
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelStyle: TextStyle(
                                  color: Theme.of(context).accentColor),
                              labelText: "Buscar...",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              prefixIcon: Icon(Icons.search)),
                          onChanged: _.search,
                        ),
                      ),
                      Container(
                        height: Get.height,
                        child: ListView.builder(
                            itemCount: _.filterFoods.length,
                            itemBuilder: (context, index) {
                              ProductOrder productOrder = ProductOrder();
                              productOrder.product = _.filterFoods[index];
                              productOrder.cantidad = 1;
                              var listcomidas = _.filterFoods[index];
                              return GestureDetector(
                                onTap: () {
                                  Get.to(DetailsproductPage(),
                                      transition: Transition.zoom,
                                      arguments: listcomidas);
                                },
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    color: Theme.of(context).primaryColor,
                                    elevation: 9,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor),
                                      height: 110,
                                      child: Stack(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: Image.asset(
                                                      "${listcomidas.img}",
                                                      fit: BoxFit.cover,
                                                      height: 120,
                                                      width: Get.width / 3.5,
                                                    )),
                                              ),
                                              Container(
                                                width: Get.width / 2,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("${listcomidas.name}",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall),
                                                    Text(
                                                        "S/${listcomidas.price}",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Positioned(
                                            right: 0,
                                            top: 10,
                                            child: IconButton(
                                                onPressed: () {
                                                 var isExist = _.conCart.carList
                                                      .firstWhereOrNull(
                                                          (element) =>
                                                              element.product!
                                                                  .id ==
                                                              listcomidas.id);
                                                  if(isExist == null){
                                                     _.conCart.carList
                                                      .add(productOrder);
                                                  _.conCart.calculateSubtotal();
                                                  _.conCart.calculateTotal();
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "Agregado al carrito",
                                                      gravity: ToastGravity.TOP,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .accentColor,
                                                      textColor: Theme.of(
                                                              context)
                                                          .scaffoldBackgroundColor,
                                                      fontSize: 16.0);
                                                  }else{
                                                     Fluttertoast.showToast(
                                                      msg:
                                                          "El producto ya fue agregado",
                                                      gravity: ToastGravity.TOP,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .accentColor,
                                                      textColor: Theme.of(
                                                              context)
                                                          .scaffoldBackgroundColor,
                                                      fontSize: 16.0);
                                                  }
                                                 
                                                },
                                                icon: FaIcon(
                                                  FontAwesomeIcons.plus,
                                                  size: 17,
                                                  color: Colors.black54,
                                                )),
                                          )
                                        ],
                                      ),
                                    )),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
