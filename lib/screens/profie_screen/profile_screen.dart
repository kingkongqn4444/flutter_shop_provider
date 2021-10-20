import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:novus_trade_v1/configs/available_languages.dart';
import 'package:novus_trade_v1/configs/ui_icons.dart';
import 'package:novus_trade_v1/models/user_response.dart' as prefix0;
import 'package:novus_trade_v1/provider/provider_user.dart';
import 'package:novus_trade_v1/widget/dialog_overlay.dart';
import 'package:provider/provider.dart';

class ProfileWidget extends StatefulWidget {
  ProfileWidget({Key key}) : super(key: key);
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  prefix0.Users user;
  String languageName = "";
  List<DialogListItem> getLanguageList() {
    List<DialogListItem> ret = [];
    AvailableLanguage.values.forEach((AvailableLanguage value) {
      LanguageSetting setting = LanguageSetting(value);
      ret.add(DialogListItem(
          option: setting.getDisplayName(context),
          image: setting.getLogo(),
          action: () {
            switch (setting.getLocaleString()) {
              case "en":
                context.locale = Locale('en', 'US');
                languageName = setting.getDisplayName(context);
                break;
              case "vi":
                context.locale = Locale('vi', 'VN');
                languageName = setting.getDisplayName(context);
                break;
              case "fr":
                context.locale = Locale('fr', 'FR');
                languageName = setting.getDisplayName(context);
                break;
              default:
                break;
            }
            Navigator.of(context).pop();
          }));
    });
    return ret;
  }

  @override
  void initState() {
    user = Provider.of<UserProvider>(context, listen: false).getUSer();
    // ApiCaller().getListBaseProduct();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).hintColor.withOpacity(0.15),
                      offset: Offset(0, 3),
                      blurRadius: 10)
                ]),
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 0),
              shrinkWrap: true,
              primary: false,
              children: [
                ListTile(
                  leading: Icon(UiIcons.user_1),
                  title: Text(
                    tr("title_profile_box"),
                    style: Theme.of(context).textTheme.body2,
                  ),
                  // trailing: ButtonTheme(
                  //   padding: EdgeInsets.all(0),
                  //   minWidth: 50.0,
                  //   height: 25.0,
                  //   child: Text('Setting'),
                  // ),
                ),
                ListTile(
                  onTap: () {},
                  dense: true,
                  title: Text(
                    tr("profile_full_name"),
                    style: Theme.of(context).textTheme.body1,
                  ),
                  trailing: Text(
                    user.firstName,
                    style: TextStyle(color: Theme.of(context).focusColor),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  dense: true,
                  title: Text(
                    tr("profile_email"),
                    style: Theme.of(context).textTheme.body1,
                  ),
                  trailing: Text(
                    user.email,
                    style: TextStyle(color: Theme.of(context).focusColor),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  dense: true,
                  title: Text(
                    tr("profile_gender"),
                    style: Theme.of(context).textTheme.body1,
                  ),
                  trailing: Text(
                    "Female",
                    style: TextStyle(color: Theme.of(context).focusColor),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  dense: true,
                  title: Text(
                    tr("profile_birth_day"),
                    style: Theme.of(context).textTheme.body1,
                  ),
                  trailing: Text(
                    "20/12/1992",
                    style: TextStyle(color: Theme.of(context).focusColor),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).hintColor.withOpacity(0.15),
                    offset: Offset(0, 3),
                    blurRadius: 10)
              ],
            ),
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 0),
              shrinkWrap: true,
              primary: false,
              children: <Widget>[
                ListTile(
                  leading: Icon(UiIcons.settings_1),
                  title: Text(
                    tr("title_box_account_setting"),
                    style: Theme.of(context).textTheme.body2,
                  ),
                ),
                // ListTile(
                //   onTap: () {},
                //   dense: true,
                //   title: Row(
                //     children: <Widget>[
                //       Icon(
                //         UiIcons.placeholder,
                //         size: 22,
                //         color: Theme.of(context).focusColor,
                //       ),
                //       SizedBox(width: 10),
                //       Text(
                //         tr("profile_shipping_address"),
                //         style: Theme.of(context).textTheme.body1,
                //       ),
                //     ],
                //   ),
                // ),
                ListTile(
                  onTap: () {
                    showAppDialog(
                        context: context,
                        builder: (_) => DialogOverlay(
                            title: tr("title_modal_language"),
                            optionsList: getLanguageList()));
                  },
                  dense: true,
                  title: Row(
                    children: <Widget>[
                      Icon(
                        UiIcons.planet_earth,
                        size: 22,
                        color: Theme.of(context).focusColor,
                      ),
                      SizedBox(width: 10),
                      Text(
                        tr("profile_language"),
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ],
                  ),
                  trailing: Text(
                    languageName,
                    style: TextStyle(color: Theme.of(context).focusColor),
                  ),
                ),
                // ListTile(
                //   onTap: () {
                //     Navigator.of(context).pushNamed('/Help');
                //   },
                //   dense: true,
                //   title: Row(
                //     children: <Widget>[
                //       Icon(
                //         UiIcons.information,
                //         size: 22,
                //         color: Theme.of(context).focusColor,
                //       ),
                //       SizedBox(width: 10),
                //       Text(
                //         tr("profile_help_support"),
                //         style: Theme.of(context).textTheme.body1,
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
