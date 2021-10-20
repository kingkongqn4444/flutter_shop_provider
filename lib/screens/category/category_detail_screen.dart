import 'package:flutter/material.dart';
import 'package:novus_trade_v1/configs/ui_icons.dart';
import 'package:novus_trade_v1/models/product.dart';
import 'package:novus_trade_v1/models/route_argument.dart';
import 'package:novus_trade_v1/widget/ShoppingCartButtonWidget.dart';

class CategoryDetail extends StatefulWidget {
  CategoryDetail({Key key}) : super(key: key);
  RouteArgument routeArgument;
  _CategoryDetailState createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final GlobalKey<ScaffoldState> _staffoldKey = new GlobalKey<ScaffoldState>();
  ProductList _produclist = new ProductList();

  @override
  void initState() {
    _tabController = TabController(length: 10, initialIndex: 1, vsync: this);
    _tabController.addListener(_handleTabSelection);

    super.initState();
  }

  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {
        widget.routeArgument.id = _tabController.index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _staffoldKey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            snap: true,
            floating: true,
            automaticallyImplyLeading: false,
            leading: new IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: new Icon(
                UiIcons.return_icon,
                color: Theme.of(context).primaryColor,
              ),
            ),
            actions: [
              new ShoppingCartButtonWidget(
                iconColor: Theme.of(context).primaryColor,
                labelColor: Theme.of(context).hintColor,
              ),
              Container(
                width: 30,
                height: 30,
                margin: EdgeInsets.only(top: 12.5, bottom: 12.5, right: 20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(300),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('img/user2.jpg'),
                  ),
                ),
              )
            ],
            backgroundColor: Theme.of(context).accentColor.withOpacity(0.9),
            expandedHeight: 250,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                              color:
                                  Theme.of(context).hintColor.withOpacity(0.10),
                              offset: Offset(0, 4),
                              blurRadius: 10)
                        ],
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Theme.of(context).accentColor,
                              Theme.of(context).focusColor
                            ])),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: "123",
                          child: Icon(
                            UiIcons.return_icon,
                            color: Theme.of(context).primaryColor,
                            size: 70,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Adidas",
                          style: Theme.of(context).textTheme.title.merge(
                              TextStyle(color: Theme.of(context).primaryColor)),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: -60,
                    bottom: -100,
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(300),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -30,
                    top: -80,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.09),
                        borderRadius: BorderRadius.circular(150),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottom: TabBar(
              controller: _tabController,
              indicatorWeight: 5,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor:
                  Theme.of(context).primaryColor.withOpacity(0.6),
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w300),
              isScrollable: true,
              indicatorColor: Theme.of(context).primaryColor,
              tabs: List.generate(10, (index) {
                return Tab(text: "Tab thứ" + index.toString());
              }),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: VerticalListProduct(rows: _produclist.list),
          // )
        ],
      ),
    );
  }
}
