// ignore_for_file: avoid_print, file_names

import 'dart:convert';

import 'package:e_commerce/data/model/product/product.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<Product>> getAllProducts() async {
    const url = 'http://10.0.2.2:8081/api/products';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      print("====================================================");
      print(json);

      final products = json.map((e) {
        return Product(
            product_id: e['product_id'],
            name: e['name'],
            price: e['price'],
            quantity: e['quantity'],
            image: e['image']);
      }).toList();
      return products;
    }
    return [];
  }
}
