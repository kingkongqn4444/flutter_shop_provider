import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:novus_trade_v1/configs/ui_icons.dart';
import 'package:novus_trade_v1/configs/utilsFunc.dart';

class SearchBarWidgate extends StatelessWidget {
  final Function onChangeText;
  SearchBarWidgate({Key key, this.onChangeText}) : super(key: key);
  final _debouncer = Debouncer(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).hintColor.withOpacity(0.1),
                offset: Offset(0, 4),
                blurRadius: 10)
          ]),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Focus(
              onFocusChange: (hasFocus) {
                if (hasFocus) {
                  print("Focus");
                }
              },
              child: TextField(
                onChanged: (e) {
                  _debouncer.run(() {
                    onChangeText(e);
                  });
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    hintText: tr("SEARCH_PLACE_HOLDER"),
                    hintStyle: TextStyle(
                        color: Theme.of(context).focusColor.withOpacity(0.8)),
                    prefixIcon: Icon(
                      UiIcons.loupe,
                      size: 20,
                      color: Theme.of(context).hintColor,
                    ),
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none)),
              )),
          IconButton(
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
            icon: Icon(
              UiIcons.settings_2,
              size: 20,
              color: Theme.of(context).hintColor.withOpacity(0.5),
            ),
          )
        ],
      ),
    );
  }
}
