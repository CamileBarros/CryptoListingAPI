import 'package:json_annotation/json_annotation.dart';

part 'crypto_market_data_response.g.dart';

@JsonSerializable()
class CryptoMarketDataResponse {
  final String price_usd;

  CryptoMarketDataResponse(this.price_usd);

  factory CryptoMarketDataResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptoMarketDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoMarketDataResponseToJson(this);
}
