import 'package:flutter/material.dart';
import 'package:novus_trade_v1/models/notification.dart';
import 'package:novus_trade_v1/widget/empty_notification_widget.dart';
import 'package:novus_trade_v1/widget/notification_item_widget.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key key}) : super(key: key);

  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationList _listNotification = new NotificationList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 7),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            Offstage(
              offstage: _listNotification.list.isEmpty,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 15),
                shrinkWrap: true,
                primary: false,
                itemCount: _listNotification.list.length,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 7);
                },
                itemBuilder: (context, index) {
                  return NotificationItemWidget(
                    notification: _listNotification.list.elementAt(index),
                  );
                },
              ),
            ),
            Offstage(
              offstage: _listNotification.list.isNotEmpty,
              child: EmptyNotificationsWidget(),
            ),
            SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    );
  }
}
