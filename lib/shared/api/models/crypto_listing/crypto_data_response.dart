import 'package:json_annotation/json_annotation.dart';
import 'crypto_market_cap_response.dart';
import 'crypto_market_data_response.dart';

part 'crypto_data_response.g.dart';

@JsonSerializable()
class CryptoDataResponse {
  final String symbol;
  final String name;
  final String slug;
  final CryptoMarketDataResponse marketData;
  final CryptoMarketCapResponse marketCap;

  CryptoDataResponse(
      this.symbol, this.name, this.slug, this.marketData, this.marketCap);

  factory CryptoDataResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptoDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoDataResponseToJson(this);
}
