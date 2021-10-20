import 'package:easy_localization/easy_localization.dart';

class IconDashBoard {
  String image;
  String title;

  IconDashBoard({this.image, this.title});
}

class ListIconDashBoard {
  List<IconDashBoard> _list;

  List<IconDashBoard> get list => _list;

  ListIconDashBoard() {
    _list = [
      new IconDashBoard(
          image: 'img/images/db_1.png', title: tr("db_item_dashboard")),
      new IconDashBoard(
          image: 'img/images/db_2.png', title: tr("db_item_items")),
      new IconDashBoard(
          image: 'img/images/db_3.png', title: tr("db_item_customer")),
      new IconDashBoard(
          image: 'img/images/db_4.png', title: tr("db_item_order")),
      new IconDashBoard(
          image: 'img/images/db_5.png', title: tr("db_item_invoices")),
      new IconDashBoard(
          image: 'img/images/db_6.png', title: tr("db_item_visits_plan")),
      new IconDashBoard(
          image: 'img/images/db_7.png', title: tr("db_item_promotion"))
    ];
  }
}
