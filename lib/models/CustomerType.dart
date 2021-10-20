class CustomeTypeResponse {
  bool success;
  String message;
  List<CustomerType> data;

  CustomeTypeResponse({this.success, this.message, this.data});

  CustomeTypeResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<CustomerType>();
      json['data'].forEach((v) {
        data.add(new CustomerType.fromJson(v));
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

class CustomerType {
  String cd;
  String name;

  CustomerType({this.cd, this.name});

  CustomerType.fromJson(Map<String, dynamic> json) {
    cd = json['cd'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cd'] = this.cd;
    data['name'] = this.name;
    return data;
  }
}
