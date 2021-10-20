class ListStateCountryResponse {
  bool success;
  String message;
  List<StateItem> data;

  ListStateCountryResponse({this.success, this.message, this.data});

  ListStateCountryResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<StateItem>();
      json['data'].forEach((v) {
        data.add(new StateItem.fromJson(v));
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

class StateItem {
  int id;
  String cd;
  String name;
  int index;
  int countryId;

  StateItem({this.id, this.cd, this.name, this.index, this.countryId});

  StateItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cd = json['cd'];
    name = json['name'];
    index = json['index'];
    countryId = json['country_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cd'] = this.cd;
    data['name'] = this.name;
    data['index'] = this.index;
    data['country_id'] = this.countryId;
    return data;
  }
}
