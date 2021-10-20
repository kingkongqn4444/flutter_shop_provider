import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:novus_trade_v1/configs/ui_icons.dart';
import 'package:novus_trade_v1/models/variant_response.dart';
import 'package:novus_trade_v1/provider/provider_product.dart';
import 'package:novus_trade_v1/widget/orderButton.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class FavoriteListItemWidget extends StatefulWidget {
  String heroTag;
  Rows rows;
  VoidCallback onDismissed;
  bool showNumber;

  FavoriteListItemWidget(
      {Key key,
      this.heroTag,
      this.showNumber = false,
      this.rows,
      this.onDismissed})
      : super(key: key);

  @override
  _FavoriteListItemWidgetState createState() => _FavoriteListItemWidgetState();
}

class _FavoriteListItemWidgetState extends State<FavoriteListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(this.widget.rows.id.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              UiIcons.trash,
              color: Colors.white,
            ),
          ),
        ),
      ),
      onDismissed: (direction) {
        // Remove the item from the data source.
        Provider.of<ProductProvider>(context, listen: false)
            .deleteItem(widget.rows);
        setState(() {
          widget.onDismissed();
        });
      },
      child: InkWell(
        splashColor: Theme.of(context).accentColor,
        focusColor: Theme.of(context).accentColor,
        highlightColor: Theme.of(context).primaryColor,
        onTap: () {
          Navigator.of(context)
              .pushNamed('/detail_product', arguments: widget.rows);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.9),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).focusColor.withOpacity(0.1),
                  blurRadius: 5,
                  offset: Offset(0, 2)),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              widget.rows.variantImages != null &&
                      widget.rows.variantImages.length > 0
                  ? Hero(
                      tag: widget.heroTag + widget.rows.id.toString(),
                      child: FadeInImage.assetNetwork(
                        width: 60,
                        height: 60,
                        imageErrorBuilder: (BuildContext context,
                            Object exception, StackTrace stackTrace) {
                          return Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("img/images/product.png"))),
                          );
                        },
                        fit: BoxFit.cover,
                        placeholder: 'img/loading.gif',
                        image:
                            "http://novustrade.co/api/file?path=${widget.rows.variantImages[0].image}",
                      ),
                    )
                  : widget.rows.images != null && widget.rows.images.length > 0
                      ? Hero(
                          tag: widget.heroTag + widget.rows.id.toString(),
                          child: FadeInImage.assetNetwork(
                            width: 60,
                            height: 60,
                            imageErrorBuilder: (BuildContext context,
                                Object exception, StackTrace stackTrace) {
                              return Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "img/images/product.png"))),
                              );
                            },
                            fit: BoxFit.cover,
                            placeholder: 'img/loading.gif',
                            image:
                                "http://novustrade.co/api/file?path=${widget.rows.images[0]}",
                          ),
                        )
                      : Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("img/images/product.png"))),
                        ),
              SizedBox(width: 15),
              Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.rows.des,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .body1
                                .merge(TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                widget.rows.brandName,
                                style: Theme.of(context).textTheme.body1.merge(
                                    TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold)),
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Available :',
                                  style: DefaultTextStyle.of(context)
                                      .style
                                      .merge(TextStyle(fontSize: 10)),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '${widget.rows.available}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              )
                            ],
                            crossAxisAlignment: CrossAxisAlignment.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Text("\$${widget.rows.defaultRetailPrice.toString()}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color(0xff22D188))),
                    SizedBox(
                      width: 10,
                    ),
                    widget.rows.available > 0
                        ? Quantitybtn(
                            showNumber: widget.showNumber,
                            rows: widget.rows,
                          )
                        : Text(tr("OUT_OF_STOCK"),
                            style: TextStyle(color: Colors.red))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
