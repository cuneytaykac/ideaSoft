import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../freezed/network_error.dart';
import '../freezed/result.dart';
import '../interfaces/base_network_model.dart';
import '../interfaces/request_protocol.dart';
import '../layers/network_connectivity.dart';
import 'network_creator.dart';
import 'network_decoding.dart';

abstract class HttpNetworkProtocol {
  Future<Result<K, NetworkError>> execute<T extends BaseNetworkModel, K>(
      {required RequestProtocol route, required T responseType});
  Future<Result<Response, NetworkError>> executeResponse(
      {required RequestProtocol route});
}

class NetworkExecuter implements HttpNetworkProtocol {
  static var shared = NetworkExecuter();

  @override
  Future<Result<K, NetworkError>> execute<T extends BaseNetworkModel, K>(
      {required RequestProtocol route, required T responseType}) async {
    // Check Network Connectivity
    if (await NetworkConnectivity.status) {
      try {
        var response = await NetworkCreator.shared.request(route);
        var data = NetworkDecoding.decode<T, K>(
            response: response, responseType: responseType);

        return Result.success(data);

        // NETWORK ERROR
      } on DioError catch (diorError) {
        debugPrint("${NetworkError.request(error: diorError)} ROUTE => $route");
        debugPrint(diorError.response.toString());
        debugPrint(diorError.response?.realUri.toString());
        return Result.failure(NetworkError.request(error: diorError));

        // TYPE ERROR
      } on TypeError catch (e, stk) {
        debugPrintStack(stackTrace: stk);
        debugPrint(NetworkError.type(error: "$e ROUTE => $route").toString());
        return Result.failure(NetworkError.type(error: e.toString()));
      }
      // No Internet Connection
    } else {
      debugPrint(
          const NetworkError.connectivity(message: 'No Internet Connection')
              .toString());
      return const Result.failure(
          NetworkError.connectivity(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Result<Response, NetworkError>> executeResponse(
      {required RequestProtocol route}) async {
    if (await NetworkConnectivity.status) {
      try {
        var response = await NetworkCreator.shared.request(route);

        return Result.success(response);

        // NETWORK ERROR
      } on DioError catch (diorError) {
        debugPrint("${NetworkError.request(error: diorError)} ROUTE => $route");
        debugPrint(diorError.response.toString());
        debugPrint(diorError.response?.realUri.toString());

        return Result.failure(NetworkError.request(error: diorError));

        // TYPE ERROR
      } on TypeError catch (e, stk) {
        debugPrintStack(stackTrace: stk);
        debugPrint(NetworkError.type(error: "$e ROUTE => $route").toString());
        return Result.failure(NetworkError.type(error: e.toString()));
      }
      // No Internet Connection
    } else {
      debugPrint(
          const NetworkError.connectivity(message: 'No Internet Connection')
              .toString());
      return const Result.failure(
          NetworkError.connectivity(message: 'No Internet Connection'));
    }
  }
}
