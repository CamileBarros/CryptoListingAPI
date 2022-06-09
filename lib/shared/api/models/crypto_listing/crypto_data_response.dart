import 'package:crypto_listing/shared/api/models/crypto_listing/crypto_metrics_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_data_response.g.dart';

@JsonSerializable()
class CryptoDataResponse {
  final String symbol;
  final String name;
  final String slug;
  final CryptoMetricsResponse metrics;
  // final List? values;

  CryptoDataResponse(this.symbol, this.name, this.slug, this.metrics);

  factory CryptoDataResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptoDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoDataResponseToJson(this);
}
