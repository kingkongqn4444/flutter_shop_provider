class PaymentTermResponse {
  bool success;
  String message;
  List<PaymentTerms> data;

  PaymentTermResponse({this.success, this.message, this.data});

  PaymentTermResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<PaymentTerms>();
      json['data'].forEach((v) {
        data.add(new PaymentTerms.fromJson(v));
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

class PaymentTerms {
  int id;
  String cd;
  String des;
  int termDay;
  int ac;
  int earlyPmtIncentive;
  int dsctDay;
  int dsctType;
  int dsctValue;
  int used;
  int isSys;
  String qbDt;
  int qbId;
  int syncToken;
  int createdBy;
  int updatedBy;
  String createdAt;
  String updatedAt;

  PaymentTerms(
      {this.id,
      this.cd,
      this.des,
      this.termDay,
      this.ac,
      this.earlyPmtIncentive,
      this.dsctDay,
      this.dsctType,
      this.dsctValue,
      this.used,
      this.isSys,
      this.qbDt,
      this.qbId,
      this.syncToken,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt});

  PaymentTerms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cd = json['cd'];
    des = json['des'];
    termDay = json['term_day'];
    ac = json['ac'];
    earlyPmtIncentive = json['early_pmt_incentive'];
    dsctDay = json['dsct_day'];
    dsctType = json['dsct_type'];
    dsctValue = json['dsct_value'];
    used = json['used'];
    isSys = json['is_sys'];
    qbDt = json['qb_dt'];
    qbId = json['qb_id'];
    syncToken = json['sync_token'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cd'] = this.cd;
    data['des'] = this.des;
    data['term_day'] = this.termDay;
    data['ac'] = this.ac;
    data['early_pmt_incentive'] = this.earlyPmtIncentive;
    data['dsct_day'] = this.dsctDay;
    data['dsct_type'] = this.dsctType;
    data['dsct_value'] = this.dsctValue;
    data['used'] = this.used;
    data['is_sys'] = this.isSys;
    data['qb_dt'] = this.qbDt;
    data['qb_id'] = this.qbId;
    data['sync_token'] = this.syncToken;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
