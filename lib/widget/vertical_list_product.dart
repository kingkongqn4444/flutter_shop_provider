import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:novus_trade_v1/models/product.dart';
import 'package:novus_trade_v1/models/variant_response.dart';
import 'package:novus_trade_v1/widget/item_product_grid.dart';

class VerticalListProduct extends StatelessWidget {
  const VerticalListProduct({Key key, @required List<Rows> rows})
      : _rows = rows,
        super(key: key);

  final List<Rows> _rows;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: new StaggeredGridView.countBuilder(
        padding: EdgeInsets.only(top: 0),
        primary: false,
        shrinkWrap: true,
        crossAxisCount: 4,
        itemCount: _rows.length,
        itemBuilder: (BuildContext context, int index) {
          Rows rows = _rows.elementAt(index);
          return ItemProductGrid(
            product: rows,
          );
        },
        staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
        mainAxisSpacing: 15.0,
        crossAxisSpacing: 15.0,
      ),
    );
  }
}
