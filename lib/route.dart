import 'package:flutter/material.dart';
import 'package:projetox/pages/details/container/detail_container.dart';
import 'package:projetox/pages/home/container/home_container.dart';
import 'package:projetox/services/product_repository.dart';

class ProductRoute extends StatelessWidget {
  const ProductRoute({Key? key, required this.repository}) : super(key: key);
  final ProductRepository repository;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) {
              return HomeContainer(
                repository: repository,
                onItemTap: (route, arguments) {
                  Navigator.of(context).pushNamed(route, arguments: arguments);
                },
              );
            },
          );
        }

        if (settings.name == '/details') {
          return MaterialPageRoute(
            builder: (context) {
              return DetailContainer(
                repository: repository,
                arguments: (settings.arguments as DetailArguments),
                onBack: () => Navigator.of(context).pop(),
              );
            },
          );
        }
      },
    );
  }
}
