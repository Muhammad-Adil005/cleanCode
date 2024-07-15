// data/datasources/product_remote_data_source.dart

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../business_layer/entities/product.dart';

class ProductRemoteDataSource {
  static const String _baseUrl = 'https://fakestoreapi.com';

  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$_baseUrl/products'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
