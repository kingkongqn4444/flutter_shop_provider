import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:novus_trade_v1/models/item_history_order.dart';

class ItemHistoryWidget extends StatelessWidget {
  ItemHistoryOrder itemHistory = new ItemHistoryOrder();
  ItemHistoryWidget({Key key, @required this.itemHistory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).hintColor.withOpacity(0.15),
                      offset: Offset(0, 3),
                      blurRadius: 10)
                ],
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Image.asset("img/images/cart.png"),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(tr("HISTORY_ORDER_NO"),
                                style: TextStyle(color: Colors.grey)),
                            Text(tr("HISTORY_AMOUNT"),
                                style: TextStyle(color: Colors.grey)),
                            Text(tr("HISTORY_CUSTOMER"),
                                style: TextStyle(color: Colors.grey))
                          ],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(itemHistory.orderNo),
                            Text(itemHistory.amount.toString(),
                                style: TextStyle(color: Colors.green)),
                            Text(itemHistory.customer)
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 14,
                    )
                  ],
                ))));
  }
}
