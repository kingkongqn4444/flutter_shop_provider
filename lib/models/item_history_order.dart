class ItemHistoryOrder {
  String image;
  String orderNo;
  double amount;
  String customer;

  ItemHistoryOrder({this.image, this.orderNo, this.amount, this.customer});
}

class ListHistory {
  List<ItemHistoryOrder> _list;
  List<ItemHistoryOrder> get list => _list;

  ListHistory() {
    _list = [
      new ItemHistoryOrder(
          image: "img/images/ob_1.gif",
          orderNo: "SO-000001",
          amount: 1231.12,
          customer: "Aqua Electronical Vietnam"),
      new ItemHistoryOrder(
          image: "img/images/ob_1.gif",
          orderNo: "SO-000001",
          amount: 1231.12,
          customer: "Aqua Electronical Vietnam"),
      new ItemHistoryOrder(
          image: "img/images/ob_1.gif",
          orderNo: "SO-000001",
          amount: 1231.12,
          customer: "Aqua Electronical Vietnam"),
    ];
  }
}
