import 'dart:convert';
import 'dart:ui';

import 'package:async/async.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:novus_trade_v1/models/product.dart';
import 'package:novus_trade_v1/models/variant_response.dart';
import 'package:novus_trade_v1/network/apiCaller.dart';
import 'package:novus_trade_v1/provider/provider_product.dart';
import 'package:novus_trade_v1/widget/ShoppingCartButtonWidget.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DetailProductScreen extends StatefulWidget {
  final ProductList productList;
  Rows product = null;

  DetailProductScreen({Key key, this.productList, this.product})
      : super(key: key);

  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProductScreen>
    with SingleTickerProviderStateMixin {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  int _tabCurrent = 0;
  int count = 0;
  TabController tabController;
  Rows rowDetail = Rows();
  AsyncMemoizer<Rows> memCache = AsyncMemoizer();
  List<Map<String, String>> listOfColumns = List();

  List<VariantAttributeOptions> listInfomation = new List();

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 2);
    tabController.addListener(onChangedTab);
    super.initState();
  }

  Future<Rows> getDetail() async {
    return memCache.runOnce(() {
      var response = ApiCaller().getDetailVariantProduct(widget.product.id);
      return response;
    });
  }

  @override
  void dispose() {
    tabController.removeListener(onChangedTab);
    tabController.dispose();
    super.dispose();
  }

  onChangedTab() {
    setState(() {
      _tabCurrent = this.tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            ShoppingCartButtonWidget(
              labelCount: Provider.of<ProductProvider>(context, listen: true)
                  .updateNumberItems(),
              iconColor: Theme.of(context).hintColor,
              labelColor: Theme.of(context).accentColor,
            ),
          ],
        ),
        body: FutureBuilder<Rows>(
          future: getDetail(),
          builder: (BuildContext context, AsyncSnapshot<Rows> snapshot) {
            if (snapshot.hasData) {
              listOfColumns = [
                {
                  "Name": tr("DETAIL_DIMEN"),
                  "Number":
                      "${snapshot.data.length}${snapshot.data.lengthUmName} x ${snapshot.data.width}${snapshot.data.lengthUmName} x ${snapshot.data.height}${snapshot.data.lengthUmName}"
                },
                {
                  "Name": tr("DETAIL_GROSS_WEIGHT"),
                  "Number":
                      "${snapshot.data.grossWeight} ${snapshot.data.massUomName}"
                },
                {
                  "Name": tr("NET_GROSS_WEIGHT"),
                  "Number":
                      "${snapshot.data.netWeight} ${snapshot.data.massUomName}"
                },
                {
                  "Name": tr("DETAIL_WARRANTY"),
                  "Number": snapshot.data.warrantyEligible == 1 ? "Yes" : "No"
                },
                {
                  "Name": tr("DETAIL_PERIOD"),
                  "Number": "${snapshot.data.warrantyPeriod} Months"
                }
              ];
              print(jsonEncode(snapshot.data).toString());
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 900,
                      child: DefaultTabController(
                          length: 2,
                          child: Scaffold(
                            appBar: PreferredSize(
                              preferredSize: Size.fromHeight(380),
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Text(
                                            snapshot.data.brandName,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  70,
                                              child: Text(
                                                snapshot.data.des,
                                                maxLines: 4,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Color(0xFF223263),
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                        ),
                                        SizedBox(height: 10),
                                        CarouselSlider(
                                            options: CarouselOptions(
                                              height: 200,
                                              aspectRatio: 16 / 9,
                                              viewportFraction: 1.0,
                                              initialPage: 0,
                                              enableInfiniteScroll: false,
                                              reverse: false,
                                              autoPlay: false,
                                              autoPlayAnimationDuration:
                                                  Duration(microseconds: 800),
                                              autoPlayCurve:
                                                  Curves.fastLinearToSlowEaseIn,
                                              enlargeCenterPage: true,
                                              onPageChanged: (index, reason) {
                                                setState(() {
                                                  _current = index;
                                                });
                                              },
                                              scrollDirection: Axis.horizontal,
                                            ),
                                            carouselController: _controller,
                                            items:
                                                snapshot.data.images.map((url) {
                                              return Builder(
                                                builder:
                                                    (BuildContext context) {
                                                  return Container(
                                                    height: 500,
                                                    child: Image.network(
                                                      "http://novustrade.co/api/file?path=$url",
                                                      fit: BoxFit.fitWidth,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                    ),
                                                  );
                                                },
                                              );
                                            }).toList()),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children:
                                              snapshot.data.images.map((url) {
                                            int index = snapshot.data.images
                                                .indexOf(url);
                                            return Container(
                                              width: 8.0,
                                              height: 8.0,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10.0,
                                                  horizontal: 2.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: _current == index
                                                    ? Color.fromRGBO(
                                                        0, 0, 0, 0.9)
                                                    : Color.fromRGBO(
                                                        0, 0, 0, 0.4),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    )),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: TabBar(
                                        onTap: (int index) {
                                          setState(() {
                                            _tabCurrent = index;
                                          });
                                        },
                                        controller: tabController,
                                        indicator: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Color(0xFF39BE6E)),
                                        labelColor: Colors.white,
                                        labelStyle: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'helvetica'),
                                        unselectedLabelColor: Color(0xFF9098B1),
                                        unselectedLabelStyle: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'helvetica'),
                                        isScrollable: true,
                                        tabs: [
                                          Tab(
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2 -
                                                  40,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: _tabCurrent == 0
                                                        ? Colors.transparent
                                                        : Color(0xFFCDD7D1)),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    tr("detail_product_tab_1")
                                                        .toUpperCase()),
                                              ),
                                            ),
                                          ),
                                          Tab(
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2 -
                                                  40,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: _tabCurrent == 1
                                                      ? Colors.transparent
                                                      : Color(0xFFCDD7D1),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    tr("detail_product_tab_2")
                                                        .toUpperCase()),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            body: TabBarView(
                                controller: tabController,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: double.infinity,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          padding: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Theme.of(context)
                                                      .accentColor
                                                      .withOpacity(0.2),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0, 3),
                                                )
                                              ]),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    renderTitle(tr(
                                                        "detail_product_infomation")),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Table(
                                                        border: TableBorder.all(
                                                            color: Color(
                                                                0xffC4CAD5)),
                                                        defaultVerticalAlignment:
                                                            TableCellVerticalAlignment
                                                                .middle,
                                                        children: snapshot.data
                                                            .variantAttributeOptions
                                                            .map(
                                                              (element) =>
                                                                  TableRow(
                                                                      children: [
                                                                    TableCell(
                                                                      child:
                                                                          Container(
                                                                        color: Color(
                                                                            0xFFEEEEEE),
                                                                        padding:
                                                                            EdgeInsets.all(10),
                                                                        child: Text(
                                                                            element.attributeDes),
                                                                      ),
                                                                    ),
                                                                    TableCell(
                                                                      child:
                                                                          Container(
                                                                        padding:
                                                                            EdgeInsets.all(10),
                                                                        child: Text(
                                                                            element.attributeOptionName),
                                                                      ),
                                                                    ),
                                                                  ]),
                                                            )
                                                            .toList()),
                                                  ])
                                            ],
                                          )),
                                      SizedBox(height: 20),
                                      Container(
                                          width: double.infinity,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          padding: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Theme.of(context)
                                                      .accentColor
                                                      .withOpacity(0.2),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0, 3),
                                                )
                                              ]),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "\$${snapshot.data.defaultRetailPrice}",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF22D188),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    snapshot.data.available > 0
                                                        ? tr("DETAIL_IN_STOCK")
                                                        : tr(
                                                            "DETAIL_OUT_STOCK"),
                                                    style: TextStyle(
                                                        color: Color(snapshot
                                                                    .data
                                                                    .available >
                                                                0
                                                            ? 0xFF429BE3
                                                            : 0xffDF3F4E),
                                                        fontSize: 15),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  Text(tr(
                                                      "DETAIL_PRODUCT_AVAILABLE : ")),
                                                  Text(
                                                    "${snapshot.data.available}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                        color:
                                                            Color(0xFF429BE3)),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              CupertinoButton(
                                                disabledColor: Colors.grey,
                                                onPressed:
                                                    snapshot.data.available > 0
                                                        ? () => {
                                                              Provider.of<ProductProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .addToCart(widget
                                                                      .product)
                                                            }
                                                        : null,
                                                color: Theme.of(context)
                                                    .accentColor,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 40,
                                                    vertical: 12),
                                                child: Text(
                                                  tr("detail_product_add_to_cart"),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .body2
                                                      .merge(TextStyle(
                                                          color: Colors.white)),
                                                ),
                                              )
                                            ],
                                          ))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Theme.of(context)
                                                      .accentColor
                                                      .withOpacity(0.2),
                                                  offset: Offset(0, 4),
                                                  blurRadius: 10)
                                            ]),
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            renderTitle(tr(
                                                "detail_product_description")),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Html(
                                              data: snapshot.data.sortDes,
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Theme.of(context)
                                                      .accentColor
                                                      .withOpacity(0.2),
                                                  offset: Offset(0, 4),
                                                  blurRadius: 10)
                                            ]),
                                        width: double.infinity,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              renderTitle(tr(
                                                  "detail_product_detail_infomation")),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Table(
                                                  border: TableBorder.all(
                                                      color: Color(0xffC4CAD5)),
                                                  defaultVerticalAlignment:
                                                      TableCellVerticalAlignment
                                                          .middle,
                                                  children: listOfColumns
                                                      .map(
                                                        (element) =>
                                                            TableRow(children: [
                                                          TableCell(
                                                            child: Container(
                                                              color: Color(
                                                                  0xFFEEEEEE),
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                              child: Text(
                                                                  element[
                                                                      "Name"]),
                                                            ),
                                                          ),
                                                          TableCell(
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                              child: Text(
                                                                  element[
                                                                      "Number"]),
                                                            ),
                                                          ),
                                                        ]),
                                                      )
                                                      .toList()),
                                            ]),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Theme.of(context)
                                                      .accentColor
                                                      .withOpacity(0.2),
                                                  offset: Offset(0, 4),
                                                  blurRadius: 10)
                                            ]),
                                        width: double.infinity,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              renderTitle(tr(
                                                  "detail_product_document")),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ]),
                                      )
                                    ],
                                  ),
                                ]),
                          )),
                    )
                  ],
                ),
              );
            } else {
              return Center(
                child: Text("Khong co data"),
              );
            }
          },
        ));
  }

  Widget renderTitle(title) {
    return Text(title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Theme.of(context).highlightColor));
  }

  Widget renderBoxItem(value) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(width: 1.0, color: const Color(0xffEBF0FF)),
      ),
      child: Center(
        child: Text(
          value.toString(),
          style: Theme.of(context).textTheme.caption,
        ),
      ),
    );
  }
}
