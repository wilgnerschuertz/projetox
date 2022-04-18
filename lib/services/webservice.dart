import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:projetox/models/products.dart';
import 'package:http/http.dart' as http;






class GetAPI{
  final ApiConstsProducts = 'https://fakestoreapi.com/products';
  final getOneProduct = 'https://fakestoreapi.com/products/{{id}}';
  final getAllCategories = 'https://fakestoreapi.com/products/categories';
  final getSearchCategories = 'https://fakestoreapi.com/products/category/{{category}}';
}

ValueNotifier<List<Product>> produtos = ValueNotifier<List<Product>>([]);

getAllProducts() async {

  var client = http.Client();
  try{
    var response = await client.get(
      Uri.parse(GetAPI().ApiConstsProducts),
    );
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    produtos.value = decodedResponse.map((e) => Product.fromJson(e)).toList();
  }finally{
    client.close();
  }
}