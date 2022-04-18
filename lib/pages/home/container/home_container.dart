import 'package:flutter/material.dart';
import 'package:projetox/models/products.dart';
import 'package:projetox/services/product_repository.dart';
import '../../../common/utilsPages/error.dart';
import '../../../common/utilsPages/loading.dart';
import '../../../error/failure.dart';
import '../../details/container/detail_container.dart';
import '../home_page_new.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    Key? key,
    required this.repository,
    required this.onItemTap,
  }) : super(key: key);
  final IProductRepository repository;
  final Function(String, DetailArguments) onItemTap;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: repository.allProductGet(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(
            list: snapshot.data!,
            onItemTap: onItemTap,
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
