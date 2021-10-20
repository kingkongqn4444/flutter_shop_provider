import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:novus_trade_v1/models/user_response.dart' as prefix0;
import 'package:novus_trade_v1/network/apiCaller.dart';
import 'package:novus_trade_v1/network/services.dart';

class UserProvider with ChangeNotifier {
  String errorMessage = "";
  bool loading = false;
  prefix0.Users user;
  String number = "";

  Future<bool> getInfomation() async {
    setLoading(true);
    await ApiCaller().getProfile().then((data) async {
      setLoading(false);
      var c = Completer<prefix0.Users>();
      try {
        var response = await Services.instance.dio.get('/auth');
        setUser(prefix0.Users.fromJson(response.data["data"]));
      } catch (e) {
        c.completeError(e);
      }
    });
    return isUser();
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  bool isLoading() {
    return loading;
  }

  void setUser(value) {
    user = value;
    notifyListeners();
  }

  prefix0.Users getUSer() {
    return user;
  }

  void setMessage(value) {
    errorMessage = value;
    notifyListeners();
  }

  String getMessage() {
    return errorMessage;
  }

  bool isUser() {
    return user != null ? true : false;
  }
}
