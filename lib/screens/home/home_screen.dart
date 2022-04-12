import 'package:flutter/material.dart';

import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({ Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
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
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      actions: [
        IconButton(
            icon: Icon(Icons.tune),
            color: Colors.black,
            onPressed: (){}
        ),
        SizedBox(width: 8)
      ],
    );
  }
}