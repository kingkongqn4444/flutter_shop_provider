import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:novus_trade_v1/models/brand.dart';
import 'package:novus_trade_v1/models/category.dart';
import 'package:novus_trade_v1/models/product.dart';
import 'package:novus_trade_v1/models/variant_response.dart';
import 'package:novus_trade_v1/network/apiCaller.dart';
import 'package:novus_trade_v1/provider/provider_product.dart';
import 'package:novus_trade_v1/widget/ShoppingCartButtonWidget.dart';
import 'package:novus_trade_v1/widget/header_content_widget.dart';
import 'package:novus_trade_v1/widget/home_slide_widget.dart';
import 'package:novus_trade_v1/widget/horizontal_list_brand.dart';
import 'package:novus_trade_v1/widget/horizontal_list_category.dart';
import 'package:novus_trade_v1/widget/item_favorite_widget.dart';
import 'package:novus_trade_v1/widget/search_bar.dart';
import 'package:novus_trade_v1/widget/vertical_list_product.dart';
import 'package:provider/provider.dart';

class TabProductScreen extends StatefulWidget {
  Function openDrawer;

  TabProductScreen({Key key, this.openDrawer}) : super(key: key);

  _TabProductScreenState createState() => _TabProductScreenState();
}

class _TabProductScreenState extends State<TabProductScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animationOpacity;
  ScrollController scrollController = new ScrollController();
  ProductList _produclist = new ProductList();
  CategoriesList _categoryList = new CategoriesList();
  BrandsList _brandsList = new BrandsList();
  var top = 0.0;
  static const double _endReachedThreshold = 200;
  String layout = 'list';
  bool isLoading = true;
  bool isLoadMore = true;
  String keySearch = "";
  ResponseProduct productResponse = ResponseProduct();

  bool isScrollIdle = false;
  int page = 1;
  var listData = List<Rows>();

  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    CurvedAnimation curve =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);
    animationOpacity = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });
    animationController.forward();
    super.initState();
    scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _getList(page);
    });
  }

  void _getList(page) {
    ApiCaller().getListVarianProduct(page, des: keySearch).then((onValue) => {
          if (onValue.success)
            {
              setState(() {
                productResponse = onValue;
                listData.addAll(onValue.data.rows);
                isLoading = false;
                isLoadMore = false;
              })
            }
        });
  }

  void _onScroll() {
    final thresholdReached =
        scrollController.position.extentAfter < _endReachedThreshold;
    if (thresholdReached &&
        isLoadMore == false &&
        page < productResponse.data.totalPage) {
      setState(() {
        isLoadMore = true;
      });
      loadMore();
    }
  }

  void loadMore() {
    setState(() {
      page = page + 1;
    });
    _getList(page);
  }

  void onChangeSearch(e) {
    setState(() {
      keySearch = e;
      page = 1;
      listData = [];
    });
    _getList(page);
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
                  title: top > 120 ? null : Text(tr("product_title_header")),
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
                        child: SearchBarWidgate(
                          onChangeText: (e) {
                            onChangeSearch(e);
                          },
                        ),
                      )
                    ],
                  ),
                );
              }),
              actions: [
                new ShoppingCartButtonWidget(
                  labelCount:
                      Provider.of<ProductProvider>(context, listen: true)
                          .updateNumberItems(),
                  iconColor: Colors.black,
                  labelColor: Theme.of(context).hintColor,
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HomeSliderWidget(),
                    HeaderContentWidget(
                      leftAction: () {
                        Navigator.of(context).pushNamed("/categories");
                      },
                      leftIcon: false,
                      title: tr("product_title_category"),
                    ),
                    HorizontaListCategory(
                      heroTag: "home_flash_sale",
                      categoryList: _categoryList.list,
                    ),
                    HeaderContentWidget(
                      leftAction: () {
                        Navigator.of(context).pushNamed("/brands");
                      },
                      leftIcon: false,
                      title: tr("product_title_brand"),
                    ),
                    HorizontaListBrand(
                      heroTag: "home_flash_sale",
                      brandList: _brandsList.list,
                    ),
                    isLoading
                        ? Center(
                            child: Text("loading..."),
                          )
                        : productResponse.data.rows.length == 0
                            ? Center(
                                child: Text("Khong co data"),
                              )
                            : Column(
                                children: [
                                  Offstage(
                                    offstage: productResponse.data.rows.isEmpty,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: ListTile(
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 0),
                                        title: HeaderContentWidget(
                                          leftIcon: false,
                                          title:
                                              tr("product_title_most_selling"),
                                        ),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  layout = "list";
                                                });
                                              },
                                              icon: Icon(
                                                  Icons.format_list_bulleted,
                                                  color: this.layout == 'list'
                                                      ? Theme.of(context)
                                                          .accentColor
                                                      : Theme.of(context)
                                                          .focusColor),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  layout = "grid";
                                                });
                                              },
                                              icon: Icon(
                                                Icons.apps,
                                                color: this.layout == 'grid'
                                                    ? Theme.of(context)
                                                        .accentColor
                                                    : Theme.of(context)
                                                        .focusColor,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Offstage(
                                    offstage: this.layout != 'list' ||
                                        _produclist.list.isEmpty,
                                    child: ListView.separated(
                                      padding: EdgeInsets.only(top: 0),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      primary: false,
                                      itemCount: listData.length,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          height: 10,
                                        );
                                      },
                                      itemBuilder: (context, index) {
                                        return FavoriteListItemWidget(
                                          heroTag: "asdasda",
                                          rows: listData.elementAt(index),
                                        );
                                      },
                                    ),
                                  ),
                                  Offstage(
                                      offstage: this.layout != 'grid' ||
                                          listData.isEmpty,
                                      child:
                                          VerticalListProduct(rows: listData)),
                                ],
                              ),
                    SizedBox(
                      height: 20,
                    ),
                    isLoadMore
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container(),
                    SizedBox(
                      height: 120,
                    )
                  ],
                ),
              ),
            ),
          ],
        )));
  }
}
