import 'package:flutter/material.dart';
import 'package:projetox/constants.dart';
import 'package:projetox/models/product_demo_list.dart';


class ItemCard extends StatelessWidget {
  // final Product product;
  // final Function press;

  const ItemCard({
    Key? key,
    // this.product,
    // this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(kDefaultPaddin),
          // height: 180,
          // width: 160,
          decoration: BoxDecoration(
            // color: products[1].color,
            borderRadius: BorderRadius.circular(16),
          ),
          child:
          // Image.asset(products[1].image),
          Image.asset(products[1].image),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
          child: Text(
            products[1].title,
            style: const TextStyle(color: kTextLightColor),
          ),
        ),
        Text(
          '\$${products[1].price}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
