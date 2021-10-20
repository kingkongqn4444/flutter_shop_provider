import 'dart:async';

import 'package:flutter/material.dart';
import 'package:novus_trade_v1/models/tab_icon_data.dart';
import 'package:novus_trade_v1/models/user_response.dart' as prefix0;
import 'package:novus_trade_v1/screens/dashboard_screen/dashboard_screen.dart';
import 'package:novus_trade_v1/screens/favorite_screen/favorite_screen.dart';
import 'package:novus_trade_v1/screens/notification_screen/notification_screen.dart';
import 'package:novus_trade_v1/screens/profie_screen/profile_screen.dart';
import 'package:novus_trade_v1/screens/tab.dart';
import 'package:novus_trade_v1/screens/tabProduct.dart';
import 'package:novus_trade_v1/widget/boom_menu/boom_menu.dart';
import 'package:novus_trade_v1/widget/boom_menu/boom_menu_item.dart';
import 'package:novus_trade_v1/widget/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController animationController;
  String currentTitle = 'Home';
  Widget tabBody = Container(
    color: Colors.white,
  );

  ScrollController scrollController;

  bool scrollVisible = true;

  List<TabIconData> tabIconsList = TabIconData.tabIconList;
  prefix0.Users user = prefix0.Users();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = DashBoardScreen();
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: [
        const Expanded(child: SizedBox()),
        TabsWidget(
          tabIconsList: tabIconsList,
          addClick: () {
            tabIconsList.forEach((TabIconData tab) {
              tab.isSelected = false;
            });
            setState(() {
              currentTitle = 'Home Screen';
              tabBody = NotificationScreen();
            });
          },
          changeIndex: (int index) {
            if (index == 0) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  currentTitle = 'Notifications';
                  tabBody = DashBoardScreen();
                });
              });
            } else if (index == 3) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  currentTitle = 'Profile';
                  tabBody = ProfileWidget();
                });
              });
            } else if (index == 2) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  currentTitle = 'Favorite';
                  tabBody = FavoritesScreen(openDrawer: () {
                    _scaffoldKey.currentState.openDrawer();
                  });
                });
              });
            } else if (index == 1) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  currentTitle = 'List Product';
                  tabBody = TabProductScreen(openDrawer: () {
                    _scaffoldKey.currentState.openDrawer();
                  });
                });
              });
            }
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget(),
      backgroundColor: Colors.white,
      body: FutureBuilder<bool>(
        future: getData(),
        builder: ((BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return Scaffold(
              body: Stack(
                children: [tabBody, bottomBar(), buildBoomMenu()],
              ),
            );
          }
        }),
      ),
    );
  }

  BoomMenu buildBoomMenu() {
    return BoomMenu(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 20.0),
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        overlayColor: Colors.red.withOpacity(0.1),
        overlayOpacity: 0.1,
        children: [
          MenuItem(
            child:
                Image.asset('assets/logout_icon.png', color: Colors.grey[850]),
            title: "Create Customer",
            titleColor: Colors.grey[850],
            subtitle: "Tạo mới customer",
            subTitleColor: Colors.grey[850],
            backgroundColor: Colors.grey[50],
            onTap: () => {Navigator.pushNamed(context, "/add_customer")},
          ),
          MenuItem(
            child: Image.asset('assets/schemes_icon.png', color: Colors.white),
            title: "Create sales order",
            titleColor: Colors.white,
            subtitle: "Tạo mới",
            subTitleColor: Colors.white,
            backgroundColor: Colors.pinkAccent,
            onTap: () => print('FOURTH CHILD'),
          ),
        ]);
  }

  openTheDrawer() {
    _scaffoldKey.currentState.openEndDrawer();
  }
}
