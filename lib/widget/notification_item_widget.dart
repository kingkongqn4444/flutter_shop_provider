import 'package:flutter/material.dart';
import 'package:novus_trade_v1/configs/ui_icons.dart';
import 'package:novus_trade_v1/models/notification.dart' as model;

class NotificationItemWidget extends StatefulWidget {
  NotificationItemWidget({Key key, this.notification}) : super(key: key);

  model.Notification notification;

  _NotificationItemWidgetState createState() => _NotificationItemWidgetState();
}

class _NotificationItemWidgetState extends State<NotificationItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(this.widget.notification.hashCode.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              UiIcons.trash,
              color: Colors.white,
            ),
          ),
        ),
      ),
      onDismissed: (direction) {
        setState(() {});
      },
      child: Container(
        color: this.widget.notification.read
            ? Colors.transparent
            : Theme.of(context).focusColor.withOpacity(0.15),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                      image: AssetImage(this.widget.notification.image),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 15,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    this.widget.notification.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.body2.merge(TextStyle(
                        fontWeight: this.widget.notification.read
                            ? FontWeight.w300
                            : FontWeight.w600)),
                  ),
                  Text(
                    this.widget.notification.time,
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
