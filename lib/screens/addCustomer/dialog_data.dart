import 'dart:convert';

import 'package:novus_trade_v1/widget/dialog_overlay.dart';

var prespect = ["Yes", "No"];

var currentcy = ["VND", "NDT", "USD", "SGN"];
var paymentMethod = ['Tiền mặt', 'Chuyển khoản', 'Ví điện tử'];

var countruySelect = ['Tiền mặt', 'Chuyển khoản', 'Ví điện tử'];

List paymentMethods({data, action}) {
  List<DialogListItem> list = [];
  data.forEach((element) {
    list.add(DialogListItem(
        option: element.name,
        action: () {
          action(element);
        }));
  });

  return list;
}

List paymentPaymentTerm({data, action}) {
  List<DialogListItem> list = [];
  data.forEach((element) {
    print(element.toString());
    list.add(DialogListItem(
        option: element.des,
        action: () {
          action(element);
        }));
  });

  return list;
}

List dataCompany({data, action}) {
  List<DialogListItem> list = [];
  data.forEach((element) {
    list.add(DialogListItem(
        option: element.name,
        action: () {
          action(element);
        }));
  });

  return list;
}

List dataSalePrice({data, action}) {
  List<DialogListItem> list = [];
  data.forEach((element) {
    list.add(DialogListItem(
        option: element.des,
        action: () {
          action(element);
        }));
  });

  return list;
}

List dataProspect({action}) {
  List<DialogListItem> list = [];
  prespect.forEach((element) {
    list.add(DialogListItem(
        option: element,
        action: () {
          action(element);
        }));
  });

  return list;
}

List dataCurrentcy({data, action}) {
  List<DialogListItem> list = [];
  data.forEach((element) {
    list.add(DialogListItem(
        option: element.name,
        action: () {
          action(element);
        }));
  });

  return list;
}
