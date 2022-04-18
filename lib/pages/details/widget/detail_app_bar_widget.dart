import 'package:flutter/material.dart';

import '../../../models/products.dart';

class DetailAppBarWidget extends StatelessWidget {
  const DetailAppBarWidget({
    Key? key,
    required this.product,
    required this.onBack,
    required this.isOnTop,
  }) : super(key: key);
  final Product product;
  final VoidCallback onBack;
  final bool isOnTop;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      leading: IconButton(
        onPressed: onBack,
        icon: const Icon(Icons.chevron_left),
      ),
      centerTitle: false,
      title: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: isOnTop ? 0 : 1,
        child: Text(
          '#${product.title.toString()}',
          // 'test',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
