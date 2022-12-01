// ignore_for_file: non_constant_identifier_names

class Product {
  int product_id;
  String name;
  double price;
  String image;
  int quantity;

  Product(
      {required this.product_id,
      required this.name,
      required this.price,
      required this.quantity,
      required this.image});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        product_id: json["product_id"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = product_id;
    data['name'] = name;
    data['price'] = price;
    data['image'] = image;
    data['quantity'] = quantity;
    return data;
  }
}
