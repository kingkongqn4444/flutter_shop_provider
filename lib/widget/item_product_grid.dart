import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:novus_trade_v1/models/variant_response.dart';
import 'package:novus_trade_v1/widget/orderButton.dart';

class ItemProductGrid extends StatelessWidget {
  const ItemProductGrid({Key key, this.product, this.heroTag})
      : super(key: key);

  final Rows product;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/detail_product', arguments: product);
      },
      highlightColor: Colors.transparent,
      splashColor: Theme.of(context).accentColor.withOpacity(0.08),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).hintColor.withOpacity(0.1),
                  offset: Offset(0, 6),
                  blurRadius: 10)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            product.variantImages.length > 0
                ? FadeInImage.assetNetwork(
                    imageErrorBuilder: (BuildContext context, Object exception,
                        StackTrace stackTrace) {
                      return Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("img/images/product.png"))),
                      );
                    },
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                    placeholder: 'img/loading.gif',
                    image:
                        "http://novustrade.co/api/file?path=${product.variantImages[0].image}",
                  )
                : Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("img/images/product.png"))),
                  ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.des.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .body2
                      .merge(TextStyle(fontSize: 12)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(product.brandName,
                      style: TextStyle(color: Colors.redAccent)),
                ),
                Text(
                  "\$" + product.defaultRetailPrice.toString(),
                  style: TextStyle(
                      color: Color(0xff22D188), fontWeight: FontWeight.bold),
                ),
                RichText(
                  text: TextSpan(
                    text: tr("ITEM_AVAILABLE"),
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                          text: '${product.available}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: product.available > 0
                      ? Quantitybtn(
                          rows: product,
                        )
                      : Text(
                          tr("OUT_OF_STOCK_GV"),
                          style: TextStyle(color: Colors.red),
                        ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
