import 'package:ecommercegetxyape/app/data/models/Product.dart';

class ProductOrder {
  Product? product;
  int? cantidad;

  ProductOrder({this.product, this.cantidad});

  ProductOrder.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    cantidad = json['cantidad'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['cantidad'] = this.cantidad;
    return data;
  }
}

