import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:novus_trade_v1/configs/ui_icons.dart';
import 'package:novus_trade_v1/provider/provider_product.dart';
import 'package:novus_trade_v1/widget/item_favorite_widget.dart';
import 'package:provider/provider.dart';

class CartWidget extends StatefulWidget {
  CartWidget({Key key}) : super(key: key);

  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(
            UiIcons.return_icon,
            color: Theme.of(context).hintColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          tr("CART_TITLE"),
          style: Theme.of(context).textTheme.display1,
        ),
        actions: [
          Container(
            width: 30,
            height: 30,
            margin: EdgeInsets.only(top: 12.5, bottom: 12.5, right: 20),
            child: InkWell(
              borderRadius: BorderRadius.circular(300),
              onTap: () {
                Navigator.of(context).pushNamed("/Tabs", arguments: 1);
              },
              child: CircleAvatar(
                backgroundImage: AssetImage('img/user2.jpg'),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 150),
            padding: EdgeInsets.only(bottom: 15),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 10),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                      leading: Icon(
                        UiIcons.shopping_cart,
                        color: Theme.of(context).hintColor,
                      ),
                      title: Text(
                        tr("CART_CONTENT"),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ),
                  ),
                  ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    primary: false,
                    itemCount: Provider.of<ProductProvider>(context)
                        .getListCart()
                        .length,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 15,
                      );
                    },
                    itemBuilder: (context, index) {
                      print(jsonEncode(Provider.of<ProductProvider>(context)
                              .getListCart()
                              .elementAt(index))
                          .toString());
                      return FavoriteListItemWidget(
                          heroTag: "123",
                          showNumber: true,
                          rows: Provider.of<ProductProvider>(context)
                              .getListCart()
                              .elementAt(index));
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
