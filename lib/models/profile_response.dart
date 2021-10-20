class ProfileResponse {
  bool success;
  String message;
  Data data;

  ProfileResponse({this.success, this.message, this.data});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  int id;
  int userProfileId;
  Null code;
  String username;
  String firstName;
  String lastName;
  Null email;
  int status;
  Null phone;
  int isManageGlobal;
  String lastLogin;
  String permission;
  int permissionIsInherit;
  Null title;
  Null department;
  Null fax;
  Null cusId;
  int isMain;
  Null timezone;
  Null deletedAt;
  String updatedAt;
  String createdAt;
  String language;
  String userProfileName;
  Profile profile;

  Data(
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
      this.permission,
      this.permissionIsInherit,
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

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userProfileId = json['user_profile_id'];
    code = json['code'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    status = json['status'];
    phone = json['phone'];
    isManageGlobal = json['is_manage_global'];
    lastLogin = json['last_login'];
    permission = json['permission'];
    permissionIsInherit = json['permission_is_inherit'];
    title = json['title'];
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
    data['permission'] = this.permission;
    data['permission_is_inherit'] = this.permissionIsInherit;
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
  String permission;
  int status;
  String updatedAt;
  int updatedBy;
  String createdAt;
  int createdBy;
  List<int> permissions;

  Profile(
      {this.id,
      this.type,
      this.code,
      this.name,
      this.des,
      this.permission,
      this.status,
      this.updatedAt,
      this.updatedBy,
      this.createdAt,
      this.createdBy,
      this.permissions});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    code = json['code'];
    name = json['name'];
    des = json['des'];
    permission = json['permission'];
    status = json['status'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    permissions = json['permissions'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['code'] = this.code;
    data['name'] = this.name;
    data['des'] = this.des;
    data['permission'] = this.permission;
    data['status'] = this.status;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['permissions'] = this.permissions;
    return data;
  }
}
