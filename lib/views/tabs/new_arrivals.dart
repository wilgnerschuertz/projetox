import 'dart:convert';
import 'package:projetox/views/base/app_strings.dart';
import 'package:projetox/views/base/base_stateless.dart';
import 'package:flutter/material.dart';
import 'package:projetox/models/products.dart';

import 'package:projetox/services/webservice.dart';
import 'package:http/http.dart' as http;

class NewArrivals extends StatefulWidget {
  const NewArrivals({Key? key}) : super(key: key);

  @override
  State<NewArrivals> createState() => _NewArrivalsState();
}

class _NewArrivalsState extends State<NewArrivals> {
  ValueNotifier<List<Product>> produtos = ValueNotifier<List<Product>>([]);

  getAllProducts() async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse(GetAPI().ApiConstsProducts),
      );
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as List;
      produtos.value = decodedResponse.map((e) => Product.fromJson(e)).toList();
    } finally {
      client.close();
    }
  }

  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

  late final Product product;
  late final EdgeInsets padding;
  late final double radius;

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ValueListenableBuilder<List<Product>>(
                valueListenable: produtos,
                builder: (_, value, __) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.length,
                  itemBuilder: (_, idx) => Card(
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Hero(
                            tag: AppStrings.instance.listHeroTag(idx),
                            child: AspectRatio(
                                aspectRatio: 1.1,
                                child:
                                    Image.network(value[idx].image.toString())),
                          ),
                          SizedBox(height: height * 0.01),
                          Text(value[idx].title.toString(),
                              style: currentTheme.textTheme.headline6!
                                  .copyWith(fontWeight: FontWeight.w300)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*

Text buildWeightText(ThemeData currentTheme) {
  return Text(
    "${product.weight.toInt()} g",
         style: currentTheme.textTheme.headline6
        .copyWith(fontWeight: FontWeight.w300),
  );
}

Text buildTitleText(ThemeData currentTheme) {
  return Text(
    product.title,
    maxLines: 2,
    style: currentTheme.textTheme.headline6,
  );
}

Text buildText(ThemeData currentTheme) {
  return Text(
    "\$ ${product.price}",
    style: currentTheme.textTheme.headline4
        .copyWith(fontWeight: FontWeight.bold),
  );
}

Expanded buildExpandedImage() {
  return Expanded(
    child: Center(
      child: AspectRatio(
          aspectRatio: 1 / 3, child: Image.network(value[idx].image.toString())),
    ),
  );
}


 */
