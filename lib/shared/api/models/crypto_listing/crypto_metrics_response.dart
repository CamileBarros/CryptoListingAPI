import 'package:crypto_listing/shared/api/models/crypto_listing/crypto_market_cap_response.dart';
import 'package:crypto_listing/shared/api/models/crypto_listing/crypto_market_data_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_metrics_response.g.dart';

@JsonSerializable()
class CryptoMetricsResponse {
  // ignore: non_constant_identifier_names
  final CryptoMarketDataResponse market_data;
  final CryptoMarketCapResponse marketcap;

  CryptoMetricsResponse(this.market_data, this.marketcap);

  factory CryptoMetricsResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptoMetricsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoMetricsResponseToJson(this);
}
