import 'package:flutter/material.dart';
import 'package:novus_trade_v1/models/category.dart';

class ListCarouseItemWidget extends StatelessWidget {
  String heroTag;
  double marginLeft;
  Category category;

  ListCarouseItemWidget({Key key, this.heroTag, this.marginLeft, this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Color(0xFFEBF0FF)),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Image.asset(category.image),
                ),
              ),
            ),
            Text(
              category.name,
              style: TextStyle(color: Color(0xFF9098B1)),
            )
          ],
        ),
      ),
    );
  }
}
