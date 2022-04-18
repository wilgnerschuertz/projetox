import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:projetox/route.dart';
import 'package:projetox/services/product_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SHOP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductRoute(
        repository: ProductRepository(
          dio: Dio(),
        )),
    );
  }
}
