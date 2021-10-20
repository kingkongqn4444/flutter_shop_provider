import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:novus_trade_v1/configs/app_ui.dart';
import 'package:novus_trade_v1/configs/ui_icons.dart';
import 'package:novus_trade_v1/models/user.dart';
import 'package:novus_trade_v1/provider/provider_user.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  User _user = new User.init().getCurrentUser();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF4992CF),
                    const Color(0xFF7AD392)
                  ], // whitish to gray
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(_user.avatar),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          Provider.of<UserProvider>(context)
                              .getUSer()
                              .firstName,
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .merge(TextStyle(color: Colors.white))),
                      SizedBox(
                        height: 10,
                      ),
                      Text(Provider.of<UserProvider>(context).getUSer().title,
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .merge(TextStyle(color: Colors.white)))
                    ],
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              UiIcons.home,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              tr("DRAWER_HOME"),
              style: Theme.of(context)
                  .textTheme
                  .subhead
                  .merge(TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          ListTile(
            onTap: () {
              // Navigator.of(context).pushNamed('/sign_in');
            },
            leading: Icon(
              UiIcons.bell,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              tr("DRAWER_ITEMS"),
              style: Theme.of(context)
                  .textTheme
                  .subhead
                  .merge(TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          ListTile(
            onTap: () {
              // Navigator.of(context).pushNamed('/Orders', arguments: 0);
            },
            leading: Icon(
              UiIcons.user_1,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              tr("DRAWER_CUSTOMER"),
              style: Theme.of(context)
                  .textTheme
                  .subhead
                  .merge(TextStyle(fontWeight: FontWeight.bold)),
            ),
            trailing: Chip(
              padding: EdgeInsets.symmetric(horizontal: 5),
              backgroundColor: Colors.transparent,
              shape: StadiumBorder(
                  side: BorderSide(color: Theme.of(context).focusColor)),
              label: Text(
                '8',
                style: TextStyle(color: Theme.of(context).focusColor),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              // Navigator.of(context).pushNamed('/Tabs', arguments: 4);
            },
            leading: Icon(
              UiIcons.heart,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              tr("DRAWER_ORDER"),
              style: Theme.of(context)
                  .textTheme
                  .subhead
                  .merge(TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          ListTile(
            onTap: () {
              // Navigator.of(context).pushNamed('/Tabs', arguments: 4);
            },
            leading: Icon(
              UiIcons.settings,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              tr("DRAWER_SETTINGS"),
              style: Theme.of(context)
                  .textTheme
                  .subhead
                  .merge(TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          ListTile(
            onTap: () {
              // Navigator.of(context).pushNamed('/Login');
            },
            leading: Icon(
              UiIcons.upload,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              tr("DRAWER_LOGOUT"),
              style: Theme.of(context)
                  .textTheme
                  .subhead
                  .merge(TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          ListTile(
            dense: true,
            title: Text(
              "Version 0.0.1",
              style: Theme.of(context).textTheme.body1,
            ),
            trailing: Icon(
              Icons.remove,
              color: Theme.of(context).focusColor.withOpacity(0.3),
            ),
          ),
        ],
      ),
    );
  }
}
