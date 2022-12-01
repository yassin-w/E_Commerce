// ignore_for_file: prefer_final_fields, file_names, avoid_print, non_constant_identifier_names

import 'package:e_commerce/data/network/api/product/product_api.dart';
import 'package:flutter/cupertino.dart';

import '../data/model/product/product.dart';

class ProductProvider extends ChangeNotifier {
  ProductApi productApi = ProductApi();

  bool isLoading = false;
  List<Product> _products = [];
  List<Product> get products => _products;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getProducts() async {
    setLoading(true);
    final response = await productApi.getProductsApi();
    print("=====================================");

    _products = response;
    setLoading(false);
  }

  Future<void> AddProduct(
      String name, double price, int quantity, String image) async {
    setLoading(true);
    final response =
        await productApi.addProductApi(name, price, quantity, image);
    print("=====================================");

    print(response.toString());
    setLoading(false);
  }

  Future<void> updateProduct(
      int id, String name, double price, int quantity, String image) async {
    setLoading(true);
    final response =
        await productApi.updateProductApi(id, name, price, quantity, image);
    print("=====================================");

    print(response.toString());
    setLoading(false);
  }

  Future<void> deleteProduct(int id) async {
    setLoading(true);
    await productApi.deleteProductApi(id);
    print("=====================================");

    setLoading(false);
  }
}
