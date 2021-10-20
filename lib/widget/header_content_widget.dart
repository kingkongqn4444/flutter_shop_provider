import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:novus_trade_v1/configs/ui_icons.dart';

class HeaderContentWidget extends StatefulWidget {
  String title;
  bool leftIcon;
  final Function leftAction;

  HeaderContentWidget(
      {Key key, @required this.title, this.leftIcon, this.leftAction})
      : super(key: key);

  _HeaderContentWidgetState createState() => _HeaderContentWidgetState();
}

class _HeaderContentWidgetState extends State<HeaderContentWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListTile(
            dense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 0),
            leading: widget.leftIcon
                ? Icon(
                    UiIcons.megaphone,
                    color: Theme.of(context).hintColor,
                  )
                : null,
            title: Text(
              widget.title,
              style: TextStyle(
                  color: Color(0xFF429BE3), fontWeight: FontWeight.bold),
            ),
            trailing: widget.leftAction != null
                ? FlatButton(
                    onPressed: widget.leftAction,
                    child: Text(
                      tr("TITLE_MORE"),
                      style: TextStyle(
                          color: Color(0xFF22D188),
                          fontWeight: FontWeight.bold),
                    ),
                  )
                : null),
      ),
    );
  }
}
