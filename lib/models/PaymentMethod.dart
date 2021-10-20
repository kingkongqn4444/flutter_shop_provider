class PaymentMethodResponse {
  bool success;
  String message;
  List<PaymentMethod> data;

  PaymentMethodResponse({this.success, this.message, this.data});

  PaymentMethodResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<PaymentMethod>();
      json['data'].forEach((v) {
        data.add(new PaymentMethod.fromJson(v));
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

class PaymentMethod {
  int id;
  String name;
  String cd;
  String des;
  int type;
  String template;

  PaymentMethod(
      {this.id, this.name, this.cd, this.des, this.type, this.template});

  PaymentMethod.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cd = json['cd'];
    des = json['des'];
    type = json['type'];
    template = json['template'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['cd'] = this.cd;
    data['des'] = this.des;
    data['type'] = this.type;
    data['template'] = this.template;
    return data;
  }
}
