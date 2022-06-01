import 'package:dio/dio.dart';

class CryptoListingEndpoint {
  final Dio _dio;

  CryptoListingEndpoint(this._dio);

  Future<Response> getAllCryptoInfo() {
    return _dio.get("/v2/assets");
  }
}
