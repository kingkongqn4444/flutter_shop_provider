class ResponseProduct {
  bool success;
  String message;
  Data data;

  ResponseProduct({this.success, this.message, this.data});

  ResponseProduct.fromJson(Map<String, dynamic> json) {
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
  int page;
  String length;
  int totalRecord;
  int totalPage;
  List<Rows> rows;

  Data({this.page, this.length, this.totalRecord, this.totalPage, this.rows});

  Data.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    length = json['length'];
    totalRecord = json['total_record'];
    totalPage = json['total_page'];
    if (json['rows'] != null) {
      rows = new List<Rows>();
      json['rows'].forEach((v) {
        rows.add(new Rows.fromJson(v));
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

class Rows {
  int id;
  String sku;
  String des;
  double defaultRetailPrice;
  double length;
  double grossWeight;
  double netWeight;
  String massUomName;
  int warrantyEligible;
  int warrantyPeriod;
  double width;
  String lengthUmName;
  double height;
  String sortDes;
  int numberInCart;
  int available;
  List<dynamic> images;
  String brandName;
  String uomName;
  List<VariantImages> variantImages;
  List<VariantAttributeOptions> variantAttributeOptions;

  Rows(
      {this.id,
      this.netWeight,
      this.grossWeight,
      this.massUomName,
      this.sku,
      this.numberInCart,
      this.des,
      this.warrantyPeriod,
      this.defaultRetailPrice,
      this.length,
      this.width,
      this.warrantyEligible,
      this.sortDes,
      this.height,
      this.images,
      this.lengthUmName,
      this.available,
      this.uomName,
      this.variantImages,
      this.variantAttributeOptions});

  Rows.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sku = json['sku'] ?? "";
    des = json['des'] ?? "";
    defaultRetailPrice = json['default_retail_price'].toDouble();
    warrantyPeriod = json['warranty_period'];
    lengthUmName = json['length_uom_name'] ?? "";
    length = json['length'].toDouble() ?? 0;
    width = json['width'].toDouble();
    grossWeight = json['gross_weight'].toDouble();
    massUomName = json['mass_uom_name'];
    warrantyEligible = json['warranty_eligible'];
    netWeight = json['net_weight'].toDouble();
    images = json['images'];
    numberInCart = 1;
    sortDes = json["short_des"] ?? "";
    height = json['height'].toDouble();
    available = json['available'];
    brandName = json['brand_name'] ?? "";
    uomName = json['uom_name'];
    if (json['variant_images'] != null) {
      variantImages = new List<VariantImages>();
      json['variant_images'].forEach((v) {
        variantImages.add(new VariantImages.fromJson(v));
      });
    }
    if (json['variant_attribute_options'] != null) {
      variantAttributeOptions = new List<VariantAttributeOptions>();
      json['variant_attribute_options'].forEach((v) {
        variantAttributeOptions.add(new VariantAttributeOptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sku'] = this.sku;
    data['des'] = this.des;
    data['net_weight'] = this.netWeight;
    data['length'] = this.length;
    data['numberInCart'] = this.numberInCart;
    data['warranty_period'] = this.warrantyPeriod;
    data['warranty_eligible'] = this.warrantyEligible;
    data['gross_weight'] = this.grossWeight;
    data['mass_uom_name'] = this.massUomName;
    data['width'] = this.width;
    data['height'] = this.height;
    data['brand_name'] = this.brandName;
    if (this.variantImages != null) {
      data['variant_images'] =
          this.variantImages.map((v) => v.toJson()).toList();
    }
    if (this.variantAttributeOptions != null) {
      data['variant_attribute_options'] =
          this.variantAttributeOptions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  String name;
  int id;
  String des;

  Category({this.name, this.id, this.des});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    des = json['des'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['des'] = this.des;
    return data;
  }
}

class ProductResponse {
  bool success;
  String message;
  Data data;

  ProductResponse({this.success, this.message, this.data});

  ProductResponse.fromJson(Map<String, dynamic> json) {
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

class DataResponse {
  int page;
  String length;
  int totalRecord;
  int totalPage;
  List<Rows> rows;

  DataResponse(
      {this.page, this.length, this.totalRecord, this.totalPage, this.rows});

  DataResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    length = json['length'];
    totalRecord = json['total_record'];
    totalPage = json['total_page'];
    if (json['rows'] != null) {
      rows = new List<Rows>();
      json['rows'].forEach((v) {
        rows.add(new Rows.fromJson(v));
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

class VariantImages {
  int id;
  int variantId;
  String image;

  VariantImages({this.id, this.variantId, this.image});

  VariantImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    variantId = json['variant_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['variant_id'] = this.variantId;
    data['image'] = this.image;
    return data;
  }
}

class VariantAttributeOptions {
  int id;
  int attributeOptionId;
  int variantId;
  String attributeOptionName;
  int attributeId;
  String attributeDes;

  VariantAttributeOptions(
      {this.id,
      this.attributeOptionId,
      this.variantId,
      this.attributeOptionName,
      this.attributeId,
      this.attributeDes});

  VariantAttributeOptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributeOptionId = json['attribute_option_id'];
    variantId = json['variant_id'];
    attributeOptionName = json['attribute_option_name'];
    attributeId = json['attribute_id'];
    attributeDes = json['attribute_des'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['attribute_option_id'] = this.attributeOptionId;
    data['variant_id'] = this.variantId;
    data['attribute_option_name'] = this.attributeOptionName;
    data['attribute_id'] = this.attributeId;
    data['attribute_des'] = this.attributeDes;
    return data;
  }
}
