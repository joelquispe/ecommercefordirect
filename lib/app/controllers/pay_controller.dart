import 'dart:ffi';
import 'dart:io';

import 'package:ecommercegetxyape/app/data/models/comida.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_share2/whatsapp_share2.dart';

class PayController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    buildMethodpay();
    buildMessage();
  }

  dynamic args = Get.arguments;

  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerAddress = TextEditingController();
  TextEditingController controllerDni = TextEditingController();
  TextEditingController controllerName = TextEditingController();

  bool isCard = false;
  void buildMethodpay() {
    if (args[1] == "plin" || args[1] == "yape") {
      isCard = false;
    } else {
      isCard = true;
    }
  }

  String mensaje = "";

  void buildMessage() {
    mensaje =
        "Datos de cliente : \n Nombre: ${controllerName.text}\n Telefono: ${controllerPhone.text} \n" +
            "Dirección: ${controllerAddress.text} \n DNI: ${controllerDni.text} \n";
    mensaje += "Productos : \n";
    args[0].forEach((element) {
      mensaje += "${element.name} :  S/${element.price.toString()} \n";
    });
    mensaje +=
        "Total : S/${args[0].map((e) => e.price).reduce((a, b) => a! + b! + 10)}";

    print(mensaje);
  }

  XFile? photo;
  RxString texto = "Subir imagen".obs;
  RxBool uploading = false.obs;
  Future requestPhoto() async {
    this.photo = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (photo != null) {
      uploading.value = true;
      texto.value = "Editar imagen";
      update();
    }
  }

  submit() {
    buildMessage();
    shareFile();
  }

  Future<void> shareFile() async {
    await WhatsappShare.shareFile(
      text: 'Recibo de pago yape \n ${mensaje}',
      phone: '51902309486',
      filePath: ["${this.photo!.path}"],
    );
  }
}
