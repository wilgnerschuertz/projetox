import 'package:flutter/material.dart';
import 'package:projetox/constants.dart';

import '../../../models/product_demo_list.dart';
import 'categories.dart';
import 'item_card.dart';

//TODO Widget BODY

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() {
    return _BodyState();
  }
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Text(
          'Loja de Roupas',
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
        child: GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: kDefaultPaddin,
              mainAxisSpacing: kDefaultPaddin,
              crossAxisCount: 2,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) => ItemCard()),
      ))
    ]);
  }
}