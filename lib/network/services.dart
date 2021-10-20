import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:novus_trade_v1/configs/SPref.dart';

class Services {
  static BaseOptions _options = new BaseOptions(
    baseUrl: "http://novustrade.co/api",
    connectTimeout: 8000,
    receiveTimeout: 8000,
  );
  static Dio _dio = Dio(_options);

  void checkForCharlesProxy(Dio dio) {
    const charlesIp =
        String.fromEnvironment('CHARLES_PROXY_IP', defaultValue: null);
    if (charlesIp == null) return;
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.findProxy = (uri) => "PROXY $charlesIp:8888;";
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
  }

  Services._internal() {
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (Options myOptions) async {
      var token = await SPref.instance.get("token");
      checkForCharlesProxy(_dio);
      if (token != null) {
        myOptions.headers["Authorization"] = "Bearer " + token;
      }
      return myOptions;
    }));
  }

  static final Services instance = Services._internal();

  Dio get dio => _dio;
}
