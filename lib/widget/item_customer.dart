import 'package:flutter/material.dart';
import 'package:novus_trade_v1/models/customer_item.dart';

class ItemCustomerWidget extends StatelessWidget {
  CustomerItem item = new CustomerItem();
  ItemCustomerWidget({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 32,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.3),
            offset: Offset(1, 1),
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Image(width: 73, image: NetworkImage(item.firstName)),
          SizedBox(
            width: 12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Align(
                child: Row(
                  children: [
                    Text("Type:"),
                    Text(item.firstName),
                    Text("Parent:"),
                    Text(item.firstName)
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Text("Phone:"),
                    Text(item.firstName),
                    Text("Fax:"),
                    Text(item.firstName)
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Text("Website:"),
                    Text(item.firstName),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Text("Address:"),
                    Text(item.firstName),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
