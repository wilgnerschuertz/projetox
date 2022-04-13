import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projetox/constants.dart';
import 'package:projetox/models/products.dart';
import 'package:projetox/services/webservice.dart';

import 'categories.dart';

//TODO Widget BODY

class Body2 extends StatefulWidget {
  const Body2({Key? key}) : super(key: key);

  @override
  _Body2State createState() {
    return _Body2State();
  }
}

class _Body2State extends State<Body2> {
  ValueNotifier<List<Product>> produtos = ValueNotifier<List<Product>>([]);

  getAllProducts() async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse(GetAPI().getAllProducts),
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
    // TODO: implement build
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Text(
          'Loja de Pods',
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      Categories(),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: ValueListenableBuilder<List<Product>>(
            valueListenable: produtos,
            builder: (_, value, __) => GridView.builder(
              itemCount: value.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: kDefaultPaddin,
                mainAxisSpacing: kDefaultPaddin,
                crossAxisCount: 2,
                childAspectRatio: 0.5,
              ),
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(kDefaultPaddin),
                        // height: 180,
                        // width: 160,
                        decoration: BoxDecoration(
                          // color: products[1].color,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child:
                            // Image.asset(products[1].image),
                            Image.network(value[index].image.toString())),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: kDefaultPaddin / 4),
                    child: Text(
                      value[index].title.toString(),
                      style: const TextStyle(color: kTextLightColor),
                    ),
                  ),
                  Text(
                    '\$${value[index].price.toString()}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
