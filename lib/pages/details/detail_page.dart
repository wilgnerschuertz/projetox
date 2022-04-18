import 'package:flutter/material.dart';
import 'package:projetox/pages/details/widget/detail_app_bar_widget.dart';
import 'package:projetox/pages/details/widget/detail_list_widget.dart';
import '../../models/products.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
    required this.product,
    required this.list,
    required this.onBack,
    required this.controller,
    required this.onChangeProduct,
  }) : super(key: key);
  final Product product;
  final List<Product> list;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Product> onChangeProduct;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  bool isOnTop = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (notification) {
          setState(() {
            if (scrollController.position.pixels > 37) {
              isOnTop = false;
            } else if (scrollController.position.pixels <= 36) {
              isOnTop = true;
            }
          });
          return false;
        },
        child: CustomScrollView(
          controller: scrollController,
          physics: const ClampingScrollPhysics(),
          slivers: [
            DetailAppBarWidget(
              product: widget.product,
              onBack: widget.onBack,
              isOnTop: isOnTop,
            ),
            DetailListWidget(
              product: widget.product,
              list: widget.list,
              controller: widget.controller,
              onChangeProduct: widget.onChangeProduct,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Container(
                      // color: widget.product.color,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
