import 'package:flutter/material.dart';
import '../../../models/products.dart';
import 'detail_item_list_widget.dart';

class DetailListWidget extends StatelessWidget {
  const DetailListWidget({
    Key? key,
    required this.product,
    required this.list,
    required this.controller,
    required this.onChangeProduct,
  }) : super(key: key);

  final Product product;
  final List<Product> list;
  final PageController controller;
  final ValueChanged<Product> onChangeProduct;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.grey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      product.title.toString(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    '#${product.id}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: PageView(
                onPageChanged: (index) => onChangeProduct(list[index]),
                controller: controller,
                children: list.map(
                      (e) {
                    bool diff = e.title != product.title;
                    return DetailItemListWidget(
                      isDiff: diff,
                      product: e,
                    );
                  },
                ).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Text(
                  '#${product.id}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
