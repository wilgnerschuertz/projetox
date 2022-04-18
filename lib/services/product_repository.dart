import 'dart:convert';
import 'package:dio/dio.dart';
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

      var response = await dio.get(ApiConstsP.allProductsURL);
      var json = jsonDecode(response.data) as List<dynamic>;
      // var list = json as List<dynamic>;
      return json.map((e) => Product.fromJson(e)).toList();

    } catch (e) {

      throw Failure(message: 'Erro ao chamar API');

    }
  }
}