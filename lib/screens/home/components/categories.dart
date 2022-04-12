import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() {
    return _CategoriesState();
  }
}

class _CategoriesState extends State<Categories> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<String> categories = [
    "News Arrivals",
    "Trens",
    "Shoes",
    "Handbads",
    "Clothes",
  ];
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(categories, index),
        ),
      ),
    );
  }

  Widget buildCategory(List<String> categories, int index) {
    return GestureDetector(
      onTap: (){
        setState(() {
          selectIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
            ),
            Container(
              margin: EdgeInsets.only(top: 1),
              height: 1,
              width: 40,
              color: selectIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}