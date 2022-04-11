import 'package:flutter/material.dart';
import 'package:projetox/views/tabs/clothes.dart';
import 'package:projetox/views/tabs/handbags.dart';
import 'package:projetox/views/tabs/new_arrivals.dart';
import 'package:projetox/views/tabs/shoes.dart';
import 'package:projetox/views/tabs/trends.dart';

class HomeProducts extends StatefulWidget {
  const HomeProducts({Key? key}) : super(key: key);

  @override
  State<HomeProducts> createState() => _HomeProductsState();
}

class _HomeProductsState extends State<HomeProducts> with SingleTickerProviderStateMixin{


  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        vsync: this,
        length: 5,
        initialIndex: 0);
  }

  @override

  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'ZUMMEDY',
          style: TextStyle(
        color: Colors.black),
       ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.tune), color: Colors.black)
        ],
        bottom: TabBar(
          indicatorWeight: 2,
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black12,
          labelStyle: TextStyle(
            fontSize: 12,
            color: Colors.black,
        ),
          controller: _tabController,
          tabs:  [
            Tab(text: 'News',),
            Tab(text: 'Clothes',),
            Tab(text: 'Shoes',),
            Tab(text: 'Handbags',),
            Tab(text: 'Trends',),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
        NewArrivals(),
        Clothes(),
        Shoes(),
        Handbags(),
        Trends(),
      ]
     ,
      ),
    );
  }
}
