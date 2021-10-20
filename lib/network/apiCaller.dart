import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:novus_trade_v1/models/CustomerType.dart';
import 'package:novus_trade_v1/models/PaymentCurrency.dart';
import 'package:novus_trade_v1/models/PaymentMethod.dart';
import 'package:novus_trade_v1/models/PaymentTerm.dart';
import 'package:novus_trade_v1/models/SalePriceList.dart';
import 'package:novus_trade_v1/models/StateCountryList.dart';
import 'package:novus_trade_v1/models/customer_item.dart';
import 'package:novus_trade_v1/models/product.dart';
import 'package:novus_trade_v1/models/user_response.dart';
import 'package:novus_trade_v1/models/user_response.dart' as prefix0;
import 'package:novus_trade_v1/models/variant_response.dart';
import 'package:novus_trade_v1/network/services.dart';

class ApiCaller {
  Future<User> signIn(String username, String password) async {
    var c = Completer<User>();
    try {
      var response = await Services.instance.dio.post('/auth/login',
          data: {"username": username, "password": password});
      var result = User.fromJson(response.data["data"]);
      c.complete(result);
    } catch (e) {
      c.completeError(e);
    }
    return c.future;
  }

  Future<prefix0.Users> getProfile() async {
    var c = Completer<prefix0.Users>();
    try {
      var response = await Services.instance.dio.get('/auth');
      var result = prefix0.Users.fromJson(response.data["data"]);
      c.complete(result);
    } catch (e) {
      c.completeError(e);
    }
    return c.future;
  }

  Future<ResponseProduct> getListVarianProduct(page, {des = ""}) async {
    var c = Completer<ResponseProduct>();
    try {
      print('/variant?page=$page&length=15&order=id&sort=DESC&des=$des');
      var response = await Services.instance.dio
          .get('/variant?page=$page&length=15&order=id&sort=DESC&des=$des');
      var result = ResponseProduct.fromJson(response.data);
      c.complete(result);
    } catch (e) {
      c.completeError(e);
    }
    return c.future;
  }

  Future<Product> getDetailBaseProduct() async {
    var c = Completer<Product>();
    try {
      var response = await Services.instance.dio.get('/baseProduct/27');
      // c.complete(result);
    } catch (e) {
      c.completeError(e);
    }
    return c.future;
  }

  Future<Rows> getDetailVariantProduct(id) async {
    var c = Completer<Rows>();
    try {
      var response =
          await Services.instance.dio.get('/baseProduct/variant/$id');
      var result = Rows.fromJson(response.data["data"]);
      c.complete(result);
    } catch (e) {
      c.completeError(e);
    }
    return c.future;
  }

  Future<CustomerResponse> getListCustomer() async {
    var c = Completer<CustomerResponse>();
    try {
      var response = await Services.instance.dio.get('/customer');
      var result = CustomerResponse.fromJson(response.data);
      c.complete(result);
    } catch (e) {
      c.completeError(e);
    }
    return c.future;
  }

  Future<CustomeTypeResponse> getListTypeCustomer() async {
    var c = Completer<CustomeTypeResponse>();
    try {
      var response = await Services.instance.dio.get('/customer/type');
      var result = CustomeTypeResponse.fromJson(response.data);
      return result;
    } catch (e) {}
    return c.future;
  }

  Future<PaymentMethodResponse> getListPaymentMethod() async {
    var c = Completer<PaymentMethodResponse>();
    try {
      var response =
          await Services.instance.dio.get('/master/payment-method/option?ac=1');
      var result = PaymentMethodResponse.fromJson(response.data);
      return result;
    } catch (e) {}
    return c.future;
  }

  Future<PaymentTermResponse> getListPaymentTerm() async {
    var c = Completer<PaymentTermResponse>();
    try {
      var response =
          await Services.instance.dio.get('/master/payment-term/option');
      var result = PaymentTermResponse.fromJson(response.data);
      return result;
    } catch (e) {}
    return c.future;
  }

  Future<PaymentCurrencyResponse> getListPaymentCurrency() async {
    var c = Completer<PaymentCurrencyResponse>();
    try {
      var response =
          await Services.instance.dio.get('/master/currency/reference');
      var result = PaymentCurrencyResponse.fromJson(response.data);
      return result;
    } catch (e) {}
    return c.future;
  }

  Future<SalePriceListResponse> getSalePriceList() async {
    var c = Completer<SalePriceListResponse>();
    try {
      var response = await Services.instance.dio.get(
          '/master/sale-price/reference?ac=1&currency_id=129&current_date=2020-12-21');
      var result = SalePriceListResponse.fromJson(response.data);
      return result;
    } catch (e) {}
    return c.future;
  }

  Future<ListStateCountryResponse> getStateCountry() async {
    var c = Completer<ListStateCountryResponse>();
    try {
      var response =
          await Services.instance.dio.get('master/country/1/state?country=1');
      print(jsonDecode(response.toString()));
      var result = ListStateCountryResponse.fromJson(response.data);
      return result;
    } catch (e) {}
    return c.future;
  }

  Future createCustomer(data) async {
    try {
      var response = await Services.instance.dio.post('/customer', data: data);
      var result = CustomerResponse.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      return e.response;
    }
  }
}
