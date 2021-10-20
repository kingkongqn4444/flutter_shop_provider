class PaymentCurrencyResponse {
  bool success;
  String message;
  List<PaymentCurrency> data;

  PaymentCurrencyResponse({this.success, this.message, this.data});

  PaymentCurrencyResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<PaymentCurrency>();
      json['data'].forEach((v) {
        data.add(new PaymentCurrency.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaymentCurrency {
  int id;
  String name;
  String alphabeticCode;
  String symbol;

  PaymentCurrency({this.id, this.name, this.alphabeticCode, this.symbol});

  PaymentCurrency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alphabeticCode = json['alphabetic_code'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['alphabetic_code'] = this.alphabeticCode;
    data['symbol'] = this.symbol;
    return data;
  }
}
