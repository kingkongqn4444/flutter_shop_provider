class User {
  String token;
  int expire;
  Users users;
  Config config;
  int exitsCustomer;

  User({this.token, this.expire, this.users, this.config, this.exitsCustomer});

  User.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expire = json['expire'];
    users = json['user'] != null ? new Users.fromJson(json['user']) : null;
    config =
        json['config'] != null ? new Config.fromJson(json['config']) : null;
    exitsCustomer = json['exits_customer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['expire'] = this.expire;
    if (this.users != null) {
      data['user'] = this.users.toJson();
    }
    if (this.config != null) {
      data['config'] = this.config.toJson();
    }
    data['exits_customer'] = this.exitsCustomer;
    return data;
  }
}

class Users {
  int id;
  int userProfileId;
  String code;
  String username;
  String firstName;
  String lastName;
  String email;
  int status;
  String phone;
  int isManageGlobal;
  String lastLogin;
  String title;
  String department;
  String fax;
  String cusId;
  int isMain;
  String timezone;
  String deletedAt;
  String updatedAt;
  String createdAt;
  String language;
  String userProfileName;
  Profile profile;

  Users(
      {this.id,
      this.userProfileId,
      this.code,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.status,
      this.phone,
      this.isManageGlobal,
      this.lastLogin,
      this.title,
      this.department,
      this.fax,
      this.cusId,
      this.isMain,
      this.timezone,
      this.deletedAt,
      this.updatedAt,
      this.createdAt,
      this.language,
      this.userProfileName,
      this.profile});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userProfileId = json['user_profile_id'];
    code = json['code'];
    username = json['username'];
    firstName = json['first_name'] ?? 'No first name';
    lastName = json['last_name'];
    email = json['email'] ?? 'No email';
    status = json['status'];
    phone = json['phone'];
    isManageGlobal = json['is_manage_global'];
    lastLogin = json['last_login'];
    title = json['title'] ?? 'No Title';
    department = json['department'];
    fax = json['fax'];
    cusId = json['cus_id'];
    isMain = json['is_main'];
    timezone = json['timezone'];
    deletedAt = json['deleted_at'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    language = json['language'];
    userProfileName = json['user_profile_name'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_profile_id'] = this.userProfileId;
    data['code'] = this.code;
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['status'] = this.status;
    data['phone'] = this.phone;
    data['is_manage_global'] = this.isManageGlobal;
    data['last_login'] = this.lastLogin;
    data['title'] = this.title;
    data['department'] = this.department;
    data['fax'] = this.fax;
    data['cus_id'] = this.cusId;
    data['is_main'] = this.isMain;
    data['timezone'] = this.timezone;
    data['deleted_at'] = this.deletedAt;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['language'] = this.language;
    data['user_profile_name'] = this.userProfileName;
    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    return data;
  }
}

class Profile {
  int id;
  int type;
  String code;
  String name;
  String des;
  int status;
  String updatedAt;
  int updatedBy;
  String createdAt;
  int createdBy;

  Profile(
      {this.id,
      this.type,
      this.code,
      this.name,
      this.des,
      this.status,
      this.updatedAt,
      this.updatedBy,
      this.createdAt,
      this.createdBy});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    code = json['code'];
    name = json['name'];
    des = json['des'];
    status = json['status'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['code'] = this.code;
    data['name'] = this.name;
    data['des'] = this.des;
    data['status'] = this.status;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    return data;
  }
}

class Config {
  String timezone;
  String formatDate;
  String currencyId;
  String currencyCode;

  Config({this.timezone, this.formatDate, this.currencyId, this.currencyCode});

  Config.fromJson(Map<String, dynamic> json) {
    timezone = json['timezone'];
    formatDate = json['format_date'];
    currencyId = json['currency_id'];
    currencyCode = json['currency_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timezone'] = this.timezone;
    data['format_date'] = this.formatDate;
    data['currency_id'] = this.currencyId;
    data['currency_code'] = this.currencyCode;
    return data;
  }
}
