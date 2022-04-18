import 'package:flutter/material.dart';

import '../../../common/utilsPages/error.dart';
import '../../../common/utilsPages/loading.dart';
import '../../../error/failure.dart';
import '../../../models/products.dart';
import '../../../services/product_repository.dart';
import '../detail_page.dart';

class DetailArguments {
  DetailArguments({this.index = 0, required this.product});

  final Product product;
  final int? index;
}

class DetailContainer extends StatefulWidget {
  const DetailContainer(
      {Key? key,
      required this.repository,
      required this.arguments,
      required this.onBack})
      : super(key: key);
  final IProductRepository repository;
  final DetailArguments arguments;
  final VoidCallback onBack;

  @override
  _DetailContainerState createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  late PageController _controller;
  late Future<List<Product>> _future;
  Product? _product;

  @override
  void initState() {
    _controller = PageController(
        viewportFraction: 0.5, initialPage: widget.arguments.index!);
    _future = widget.repository.allProductGet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          _product ??= widget.arguments.product;
          return DetailPage(
            product: _product!,
            list: snapshot.data!,
            onBack: widget.onBack,
            controller: _controller,
            onChangeProduct: (Product value) => setState(
              () {
                _product = value;
              },
            ),
          );
        }

        if (snapshot.hasError) {
          return PoError(
            error: (snapshot.error as Failure).message!,
          );
        }

        return Container();
      },
    );
  }
}
