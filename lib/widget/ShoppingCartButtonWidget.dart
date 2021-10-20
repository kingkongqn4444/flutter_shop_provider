import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:novus_trade_v1/configs/ui_icons.dart';

class ShoppingCartButtonWidget extends StatelessWidget {
  const ShoppingCartButtonWidget({
    this.iconColor,
    this.labelColor,
    this.labelCount = 0,
    Key key,
  }) : super(key: key);

  final Color iconColor;
  final Color labelColor;
  final int labelCount;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/cart');
      },
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: <Widget>[
          Container(
            child: Badge(
              badgeColor: Theme.of(context).accentColor,
              toAnimate:true,
              animationDuration: Duration(milliseconds: 500),
              animationType: BadgeAnimationType.scale,
              badgeContent: Text(
                this.labelCount.toString(),
             textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption.merge(
            TextStyle(color: Theme.of(context).primaryColor, fontSize: 12,fontWeight: FontWeight.bold),
          ),
           ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Icon(
                  UiIcons.shopping_cart,
                  color: this.iconColor,
                  size: 28,
                ),
              ),
            ),
            padding: EdgeInsets.all(0),
            // constraints: BoxConstraints(minWidth: 15, maxWidth: 15, minHeight: 15, maxHeight: 15),
          ),
        ],
      ),
      color: Colors.transparent,
    );
  }
}
