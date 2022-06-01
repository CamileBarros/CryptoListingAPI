import 'package:crypto_listing/shared/api/models/crypto_listing/crypto_market_cap_response.dart';
import 'package:crypto_listing/shared/api/models/crypto_listing/crypto_market_data_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_metrics_response.g.dart';

@JsonSerializable()
class CryptoMetricsResponse {
  final List<CryptoMarketDataResponse> marketData;
  final List<CryptoMarketCapResponse> marketCap;

  CryptoMetricsResponse(this.marketData, this.marketCap);

  factory CryptoMetricsResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptoMetricsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoMetricsResponseToJson(this);
}
