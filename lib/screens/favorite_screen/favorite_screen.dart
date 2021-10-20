import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:novus_trade_v1/models/customer_item.dart';
import 'package:novus_trade_v1/models/product.dart';
import 'package:novus_trade_v1/network/apiCaller.dart';
import 'package:novus_trade_v1/widget/ShoppingCartButtonWidget.dart';
import 'package:novus_trade_v1/widget/item_customer.dart';
import 'package:novus_trade_v1/widget/search_bar.dart';

class FavoritesScreen extends StatefulWidget {
  Function openDrawer;
  FavoritesScreen({Key key, this.openDrawer}) : super(key: key);

  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  String layout = 'grid';
  // CustomerList _customerList = new CustomerList();
  var top = 0.0;
  var listData = List<CustomerItem>();
  CustomerResponse productResponse = CustomerResponse();
  bool isScrollIdle = false;
  ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _getListCustomer();
    });
  }

  void _getListCustomer() {
    ApiCaller().getListCustomer().then((value) => {
          if (value.success)
            {
              setState(() {
                productResponse = value;
                listData.addAll(value.data.rows);
              })
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
        onNotification: (Notification notification) {
          if (notification is UserScrollNotification) {
            if (notification.direction == ScrollDirection.idle) {
              if (top == 100) {
                return true;
              }
              if (top > 100 && top < 140) {
                isScrollIdle = true;
                Future.delayed(Duration.zero, () {
                  if (isScrollIdle == false) return;
                  scrollController.animateTo(100,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOut);
                });
              } else if (top > 140) {
                isScrollIdle = true;
                Future.delayed(Duration.zero, () {
                  if (isScrollIdle == false) return;
                  scrollController.animateTo(0,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOut);
                });
              }
            }
          }
          return false;
        },
        child: Scaffold(
            body: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              floating: false,
              expandedHeight: 150.0,
              leading: new IconButton(
                icon: new Icon(Icons.sort, color: Colors.black),
                onPressed: () => {widget.openDrawer()},
              ),
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                top = constraints.biggest.height;
                return FlexibleSpaceBar(
                  title: top > 120 ? null : Text("Favorite"),
                  background: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("img/images/BG.png"),
                                fit: BoxFit.fitWidth)),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SearchBarWidgate(),
                      )
                    ],
                  ),
                );
              }),
              actions: [
                new ShoppingCartButtonWidget(
                  iconColor: Colors.black,
                  labelColor: Theme.of(context).hintColor,
                ),
              ],
            ),
            SliverToBoxAdapter(
                child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Container(
                            child: Text("CUSTOMERS",
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(80, 20, 80, 20),
                            child: Row(
                              children: [
                                Text(
                                  "Total",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "1",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Spacer(),
                                Text(
                                  "Prospect",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "2",
                                  style: Theme.of(context).textTheme.bodyText1,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8)),
                      onPressed: () {},
                      child: Text(
                        "Create New",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      color: Color(0xFFF7CA18),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20)),
                          Offstage(
                            offstage: listData.isEmpty,
                            child: ListView.separated(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                shrinkWrap: true,
                                primary: false,
                                itemBuilder: (context, index) {
                                  return ItemCustomerWidget(
                                      item: listData.elementAt(index));
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 12,
                                  );
                                },
                                itemCount: listData.length),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    )
                  ],
                ),
              ),
            )),
          ],
        )));
  }
}
