import 'package:dio/dio.dart';
import 'package:novus_trade_v1/configs/SPref.dart';
import 'package:novus_trade_v1/models/customer_item.dart';

import 'api_result.dart';
import 'dioClient.dart';
import 'network_exceptions.dart';

class APIRepository {
  DioClient dioClient;
  String _baseUrl = "http://novustrade.co/api";

  APIRepository() {
    var dio = Dio();

    dioClient = DioClient(_baseUrl, dio);
  }

  Future<ApiResult<CustomerResponse>> addCustomer(data) async {
    try {
      final response = await dioClient.post("/customer", data: data);
      CustomerResponse createCustomer = CustomerResponse.fromJson(response);
      return ApiResult.success(data: createCustomer);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
