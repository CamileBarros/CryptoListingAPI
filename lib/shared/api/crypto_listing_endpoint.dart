import 'package:dio/dio.dart';

class CryptoListingEndpoint {
  final Dio _dio;

  CryptoListingEndpoint(this._dio);

  Future<Response> getAllCryptoInfo() {
    return _dio.get("/v1/assets");
  }

  Future<Response> getAllChartsInfo() {
    return _dio.get(
        "/v1/assets/BTC/metrics/price/time-series?end=2022-06-01&interval=1d");
  }
}
