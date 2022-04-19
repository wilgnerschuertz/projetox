import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:projetox/error/failure.dart';
import 'package:projetox/services/api_consts.dart';

import '../models/products.dart';

abstract class IProductRepository {
  Future<List<Product>> allProductGet();
}

class ProductRepository implements IProductRepository {
  final Dio dio;
  ProductRepository({required this.dio});

  @override
  Future<List<Product>> allProductGet() async {
    try {
      Response response = await Dio().get(ApiConstsP.allProductsURL);
      if (kDebugMode) {
        print(response);
      }
      return (response.data as List).map((e) => Product.fromJson(e)).toList();
    } catch (e) {
      throw Failure(message: "Error ao chamar API");
    }
  }
}