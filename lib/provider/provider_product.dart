import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:novus_trade_v1/models/variant_response.dart';
import 'package:novus_trade_v1/network/apiCaller.dart';
import 'package:novus_trade_v1/network/services.dart';

class ProductProvider extends ChangeNotifier {
  int itemIncart = 0;
  Rows row;
  bool loading = false;
  ResponseProduct data;
  List<Rows> listItemInCart = [];

  Future<ResponseProduct> getListVarianProduct(page) async {
    await ApiCaller().getProfile().then((data) async {
      var c = Completer<ResponseProduct>();
      try {
        var response = await Services.instance.dio
            .get('/variant?page=$page&length=15&order=id&sort=DESC');
        setProduct(ResponseProduct.fromJson(response.data));
      } catch (e) {
        c.completeError(e);
      }
    });
  }

  void setProduct(value) {
    data = value;
    notifyListeners();
  }

  void addToCart(product) {
    // print(jsonEncode(product).toString());
    if (listItemInCart.contains(product)) {
      var index = listItemInCart.indexOf(product);
      listItemInCart[index].numberInCart =
          listItemInCart[index].numberInCart + 1;
    } else {
      product.numberInCart = 1;
      listItemInCart.add(product);
    }
    notifyListeners();
  }

  int updateNumberItems() {
    var sum = 0;
    listItemInCart.forEach((e) => sum += e.numberInCart);
    return sum;
  }

  void removeItemCart(product) {
    if (listItemInCart.contains(product)) {
      var index = listItemInCart.indexOf(product);
      if (listItemInCart[index].numberInCart > 0) {
        listItemInCart[index].numberInCart =
            listItemInCart[index].numberInCart - 1;
      } else {
        listItemInCart.remove(product);
      }
    }
    notifyListeners();
  }

  void deleteItem(product) {
    if (listItemInCart.contains(product)) {
        listItemInCart.remove(product);
    }
    notifyListeners();
  }

  List<Rows> getListCart() {
    return listItemInCart;
  }

  ResponseProduct getProduct() {
    return data;
  }
}
