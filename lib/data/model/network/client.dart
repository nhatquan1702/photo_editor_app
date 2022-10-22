import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

extension DioExtension on Dio {
  Dio initClient(String baseUrl) {
    options.baseUrl = baseUrl;
    options.connectTimeout = 30000;
    options.receiveTimeout = 30000;
    options.sendTimeout = 1800000;

    if (kDebugMode) interceptors.add(LogInterceptor(responseBody: true));
    return this;
  }
}

class ClientUtils {
  static Options pixelAuth = Options(
    headers: {
      "Authorization":
      "563492ad6f917000010000019dcc48df08bc4c60b6ce013ea1a31373",
    },
  );
}