// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_commerce/data/model/product/product.dart';

import '../../dio_client.dart';
import '../constant/endpoints.dart';

class ProductApi extends DioClient {
  final DioClient dioClient = DioClient();

  Future<Product> addProductApi(
      String name, double price, int quantity, String image) async {
    try {
      final Response response = await dioClient.post(
        Endpoints.products,
        data: {
          'name': name,
          'price': price,
          'quantity': quantity,
          'image': image
        },
      );
      return Product.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Product>> getProductsApi() async {
    try {
      final Response response = await dio.get(Endpoints.products);
      final products = (response.data as List).map((e) {
        print(e);
        print("88888888888888888888888888888888888");
        return Product(
            product_id: e['product_id'],
            name: e['name'],
            price: e['price'],
            quantity: e['quantity'],
            image: e['image']);
      }).toList();
      return products;
    } catch (e) {
      rethrow;
    }
  }

  Future<Product> updateProductApi(
      int id, String name, double price, int quantity, String image) async {
    try {
      final Response response = await dioClient.put(
        '${Endpoints.products}/$id',
        data: {
          'name': name,
          'price': price,
          'quantity': quantity,
          'image': image
        },
      );
      return Product.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteProductApi(int id) async {
    try {
      await dioClient.delete('${Endpoints.products}/$id');
    } catch (e) {
      rethrow;
    }
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
