import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:novus_trade_v1/models/variant_response.dart';
import 'package:novus_trade_v1/provider/provider_product.dart';
import 'package:provider/provider.dart';

class Quantitybtn extends StatefulWidget {
  Rows rows;
  bool showNumber;

  Quantitybtn({Key key, this.rows, this.showNumber = false}) : super(key: key);

  @override
  QuantitybtnState createState() => QuantitybtnState();
}

class QuantitybtnState extends State<Quantitybtn> {
  bool visibility = false;
  var count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.showNumber) {
      setState(() {
        visibility = true;
        count = widget.rows.numberInCart;
      });
    }
  }

  void _changed() {
    // setState(() {
    //   visibility = !visibility;
    // });
    Provider.of<ProductProvider>(context, listen: false).addToCart(widget.rows);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Visibility(
      visible: visibility,
      child: Container(
        height: width * 0.08,
        alignment: Alignment.center,
        width: width * 0.23,
        decoration: BoxDecoration(
            color: Color(0xffEBF0FF),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1, color: Color(0xffEBF0FF))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: width * 0.08,
              height: width * 0.08,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5))),
              child: IconButton(
                icon: Icon(Icons.remove, color: Color(0xff9098B1), size: 10),
                onPressed: () {
                  setState(() {
                    if (count == 1) {
                      return;
                    } else {
                      Provider.of<ProductProvider>(context, listen: false)
                          .removeItemCart(widget.rows);
                      count = count - 1;
                      return;
                    }
                  });
                },
              ),
            ),
            Text("$count"),
            Container(
              width: width * 0.08,
              height: width * 0.08,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5))),
              child: IconButton(
                icon: Icon(Icons.add, color: Color(0xff9098B1), size: 10),
                onPressed: () {
                  Provider.of<ProductProvider>(context, listen: false)
                      .addToCart(widget.rows);
                  setState(() {
                    count = count + 1;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      replacement: GestureDetector(
        onTap: () {
          _changed();
        },
        child: Container(
          width: width * 0.22,
          height: width * 0.08,
          decoration: BoxDecoration(
              color: Color(0xFFEBF0FF), borderRadius: BorderRadius.circular(5)),
          alignment: Alignment.center,
          child: Text(tr("ADD_BTN")),
        ),
      ),
    );
  }
}
