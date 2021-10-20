import 'package:flutter/material.dart';
import 'package:novus_trade_v1/models/category.dart';
import 'package:novus_trade_v1/widget/list_carouse_item_widget.dart';

class HorizontaListCategory extends StatelessWidget {
  List<Category> categoryList;
  String heroTag;

  HorizontaListCategory({Key key, this.categoryList, this.heroTag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          double _marginLeft = 0;
          (index == 0) ? _marginLeft = 20 : _marginLeft = 0;
          return ListCarouseItemWidget(
            heroTag: this.heroTag,
            marginLeft: _marginLeft,
            category: categoryList.elementAt(index),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
