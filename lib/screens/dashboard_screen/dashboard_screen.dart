import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:novus_trade_v1/configs/app_ui.dart';
import 'package:novus_trade_v1/models/icon_dashboard.dart';
import 'package:novus_trade_v1/models/item_history_order.dart';
import 'package:novus_trade_v1/provider/provider_user.dart';
import 'package:novus_trade_v1/widget/header_content_widget.dart';
import 'package:novus_trade_v1/widget/item_history_order.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({Key key}) : super(key: key);
  ListHistory _listHistory = new ListHistory();
  ListIconDashBoard _listIconDashBoard = new ListIconDashBoard();
  double width = 100.0;
  double height = 120.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 100),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("img/images/BG.png"),
                fit: BoxFit.cover,
              )),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 39.0,
                    backgroundColor: Color(0xffFFFFFF),
                    child: CircleAvatar(
                      radius: 38,
                      backgroundImage: AssetImage('img/images/avatar.png'),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Provider.of<UserProvider>(context)
                              .getUSer()
                              .firstName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        Text(
                            Provider.of<UserProvider>(context).getUSer().email),
                        Text("Ho Chi Minh , Viet Nam")
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.fromLTRB(20.0, 140.0, 20.0, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor,
                  boxShadow: UI.boxShadow(context)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          tr("db_today_order"),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          ' 10',
                          overflow: TextOverflow.ellipsis,
                        ),
                        Spacer(),
                        Text(
                          tr("db_total_amount"),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '\$1000.00 ',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 0.5,
                    color: Colors.green.withOpacity(0.5),
                  ),
                  Container(
                      height: 190,
                      child: GridView.builder(
                        padding: const EdgeInsets.only(top: 10),
                        // physics: new NeverScrollableScrollPhysics(),
                        gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 1,
                                crossAxisCount: 4,
                                mainAxisSpacing: 8),
                        itemCount: _listIconDashBoard.list.length,
                        itemBuilder: (BuildContext context, int index) {
                          IconDashBoard iconDashboard =
                              _listIconDashBoard.list.elementAt(index);
                          return Column(
                            children: [
                              Image.asset(
                                iconDashboard.image,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                iconDashboard.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .body2
                                    .merge(TextStyle(fontSize: 10)),
                              ),
                            ],
                          );
                        },
                      )),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        HeaderContentWidget(
          leftIcon: false,
          title: tr("db_active_order"),
        ),
        Column(
          children: _listHistory.list.map((ItemHistoryOrder itemHistoryOrder) {
            return Builder(
              builder: (BuildContext context) {
                return ItemHistoryWidget(itemHistory: itemHistoryOrder);
              },
            );
          }).toList(),
        ),
        SizedBox(
          height: 100,
        )
      ],
    ));
  }
}
