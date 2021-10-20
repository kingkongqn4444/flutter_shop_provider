class SalePriceListResponse {
  bool success;
  String message;
  List<SalePrice> data;

  SalePriceListResponse({this.success, this.message, this.data});

  SalePriceListResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<SalePrice>();
      json['data'].forEach((v) {
        data.add(new SalePrice.fromJson(v));
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

class SalePrice {
  int id;
  String code;
  String des;

  SalePrice({this.id, this.code, this.des});

  SalePrice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    des = json['des'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['des'] = this.des;
    return data;
  }
}
