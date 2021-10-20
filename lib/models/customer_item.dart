class CustomerResponse {
  bool success;
  String message;
  CustomerData data;

  CustomerResponse({this.success, this.message, this.data});

  CustomerResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data =
        json['data'] != null ? new CustomerData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class CustomerData {
  int page;
  int length;
  int totalRecord;
  int totalPage;
  List<CustomerItem> rows;

  CustomerData(
      {this.page, this.length, this.totalRecord, this.totalPage, this.rows});

  CustomerData.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    length = json['length'];
    totalRecord = json['total_record'];
    totalPage = json['total_page'];
    if (json['rows'] != null) {
      rows = new List<CustomerItem>();
      json['rows'].forEach((v) {
        rows.add(new CustomerItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['length'] = this.length;
    data['total_record'] = this.totalRecord;
    data['total_page'] = this.totalPage;
    if (this.rows != null) {
      data['rows'] = this.rows.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerItem {
  int id;
  String cd;
  String firstName;
  String lastName;
  String type;
  int parentId;
  String registration;
  String phone;
  String website;
  String email;
  String fax;
  int index;
  int ac;
  int creditBalance;
  int creditLimit;
  String creditReason;
  int creditUsed;
  int totalDebit;
  int totalCredit;
  int totalBalance;
  int currencyId;
  int salePriceId;
  int carrierId;
  int salePersonId;
  Null warehouseId;
  int paymentMadeBy;
  int paymentTermId;
  int paymentMethodId;
  int taxable;
  Null qbDt;
  Null qbId;
  int loyaltyDiscount;
  int syncToken;
  Null oldCode;
  Null oldType;
  Null conversionDate;
  Null lastSaleDt;
  int prospectStatus;
  int createdBy;
  String createdAt;
  int updatedBy;
  String updatedAt;
  String parentName;
  String typeName;
  String createdByName;
  String updatedByName;
  String name;
  String prospectStatusName;

  CustomerItem(
      {this.id,
      this.cd,
      this.firstName,
      this.lastName,
      this.type,
      this.parentId,
      this.registration,
      this.phone,
      this.website,
      this.email,
      this.fax,
      this.index,
      this.ac,
      this.creditBalance,
      this.creditLimit,
      this.creditReason,
      this.creditUsed,
      this.totalDebit,
      this.totalCredit,
      this.totalBalance,
      this.currencyId,
      this.salePriceId,
      this.carrierId,
      this.salePersonId,
      this.warehouseId,
      this.paymentMadeBy,
      this.paymentTermId,
      this.paymentMethodId,
      this.taxable,
      this.qbDt,
      this.qbId,
      this.loyaltyDiscount,
      this.syncToken,
      this.oldCode,
      this.oldType,
      this.conversionDate,
      this.lastSaleDt,
      this.prospectStatus,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.parentName,
      this.typeName,
      this.createdByName,
      this.updatedByName,
      this.name,
      this.prospectStatusName});

  CustomerItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cd = json['cd'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    type = json['type'];
    parentId = json['parent_id'];
    registration = json['registration'];
    phone = json['phone'];
    website = json['website'];
    email = json['email'];
    fax = json['fax'];
    index = json['index'];
    ac = json['ac'];
    creditBalance = json['credit_balance'];
    creditLimit = json['credit_limit'];
    creditReason = json['credit_reason'];
    creditUsed = json['credit_used'];
    totalDebit = json['total_debit'];
    totalCredit = json['total_credit'];
    totalBalance = json['total_balance'];
    currencyId = json['currency_id'];
    salePriceId = json['sale_price_id'];
    carrierId = json['carrier_id'];
    salePersonId = json['sale_person_id'];
    warehouseId = json['warehouse_id'];
    paymentMadeBy = json['payment_made_by'];
    paymentTermId = json['payment_term_id'];
    paymentMethodId = json['payment_method_id'];
    taxable = json['taxable'];
    qbDt = json['qb_dt'];
    qbId = json['qb_id'];
    loyaltyDiscount = json['loyalty_discount'];
    syncToken = json['sync_token'];
    oldCode = json['old_code'];
    oldType = json['old_type'];
    conversionDate = json['conversion_date'];
    lastSaleDt = json['last_sale_dt'];
    prospectStatus = json['prospect_status'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedBy = json['updated_by'];
    updatedAt = json['updated_at'];
    parentName = json['parent_name'];
    typeName = json['type_name'];
    createdByName = json['created_by_name'];
    updatedByName = json['updated_by_name'];
    name = json['name'];
    prospectStatusName = json['prospect_status_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cd'] = this.cd;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['type'] = this.type;
    data['parent_id'] = this.parentId;
    data['registration'] = this.registration;
    data['phone'] = this.phone;
    data['website'] = this.website;
    data['email'] = this.email;
    data['fax'] = this.fax;
    data['index'] = this.index;
    data['ac'] = this.ac;
    data['credit_balance'] = this.creditBalance;
    data['credit_limit'] = this.creditLimit;
    data['credit_reason'] = this.creditReason;
    data['credit_used'] = this.creditUsed;
    data['total_debit'] = this.totalDebit;
    data['total_credit'] = this.totalCredit;
    data['total_balance'] = this.totalBalance;
    data['currency_id'] = this.currencyId;
    data['sale_price_id'] = this.salePriceId;
    data['carrier_id'] = this.carrierId;
    data['sale_person_id'] = this.salePersonId;
    data['warehouse_id'] = this.warehouseId;
    data['payment_made_by'] = this.paymentMadeBy;
    data['payment_term_id'] = this.paymentTermId;
    data['payment_method_id'] = this.paymentMethodId;
    data['taxable'] = this.taxable;
    data['qb_dt'] = this.qbDt;
    data['qb_id'] = this.qbId;
    data['loyalty_discount'] = this.loyaltyDiscount;
    data['sync_token'] = this.syncToken;
    data['old_code'] = this.oldCode;
    data['old_type'] = this.oldType;
    data['conversion_date'] = this.conversionDate;
    data['last_sale_dt'] = this.lastSaleDt;
    data['prospect_status'] = this.prospectStatus;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_by'] = this.updatedBy;
    data['updated_at'] = this.updatedAt;
    data['parent_name'] = this.parentName;
    data['type_name'] = this.typeName;
    data['created_by_name'] = this.createdByName;
    data['updated_by_name'] = this.updatedByName;
    data['name'] = this.name;
    data['prospect_status_name'] = this.prospectStatusName;
    return data;
  }
}
