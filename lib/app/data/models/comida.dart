class Comida {
  String? id;
  String? name;
  String? description;
  String? price;
  String? category;
  String? img;

  Comida(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.category,
      this.img});

  Comida.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    category = json['category'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['category'] = this.category;
    data['img'] = this.img;
    return data;
  }
}