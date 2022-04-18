import 'package:flutter/material.dart';

import '../../../models/products.dart';
import '../../details/container/detail_container.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    Key? key,
    required this.product,
    required this.onTap,
    required this.index,

  }) : super(key: key);

  final Product product;

  final Function(String, DetailArguments) onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          onTap('/details',
            DetailArguments(product: product, index: index),),
    );
    return Container();
  }
}
