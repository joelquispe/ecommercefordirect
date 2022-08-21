import 'dart:io';

import 'package:ecommercegetxyape/app/ui/pages/pay_page/widgets/methodpay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/pay_controller.dart';

class PayPage extends GetView<PayController> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PayController>(
        init: PayController(),
        builder: (_) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_new,
                                color: Theme.of(context).accentColor,
                              )),
                        ),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "assets/img/pays/${_.args[1]}.png",
                              height: 100,
                            )),
                            SizedBox(
                          height: 10,
                        ),
                        _.isCard == false? methodpayW(context, Icon(Icons.phone_android), "902-309-486") :methodpayW(context, Icon(Icons.payment), "12312312312123"),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          style: Theme.of(context).textTheme.bodySmall,
                          controller: _.controllerName,
                          decoration: InputDecoration(
                            labelText: "Nombres y Apellidos",
                            labelStyle: TextStyle(
                              color: Theme.of(context).accentColor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: Theme.of(context).textTheme.bodySmall,
                          controller: _.controllerDni,
                          decoration: InputDecoration(
                            labelText: "DNI",
                            labelStyle: TextStyle(
                              color: Theme.of(context).accentColor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: Theme.of(context).textTheme.bodySmall,
                          controller: _.controllerPhone,
                          decoration: InputDecoration(
                            labelText: "Celular / Teléfono",
                            labelStyle: TextStyle(
                              color: Theme.of(context).accentColor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                        TextFormField(
                          style: Theme.of(context).textTheme.bodySmall,
                          controller: _.controllerAddress,
                          decoration: InputDecoration(
                            labelText: "Dirección",
                            labelStyle: TextStyle(
                              color: Theme.of(context).accentColor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  _.requestPhoto();
                                },
                                child: Obx(() => Text("${_.texto.value}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium))),
                            Obx(
                              () => _.uploading.value == false
                                  ? Container(
                                      height: 100,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  Theme.of(context).accentColor,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.camera,
                                            color:
                                                Theme.of(context).accentColor,
                                          )
                                        ],
                                      ),
                                    )
                                  : Image.file(
                                      File(_.photo!.path),
                                      height: 100,
                                    ),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        ElevatedButton(
                            onPressed: () {
                              _.submit();
                              // _.buildMessage();
                            },
                            child: Text("Enviar",
                                style:
                                    Theme.of(context).textTheme.labelMedium)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
