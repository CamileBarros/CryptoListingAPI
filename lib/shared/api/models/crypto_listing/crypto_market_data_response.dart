// ignore_for_file: non_constant_identifier_names

import 'package:crypto_listing/shared/api/models/crypto_listing/crypto_value_day_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_market_data_response.g.dart';

@JsonSerializable()
class CryptoMarketDataResponse {
  final num price_usd;
  final num percent_change_usd_last_1_hour;
  final CryptoValueDayResponse ohlcv_last_1_hour;

  CryptoMarketDataResponse(this.price_usd, this.percent_change_usd_last_1_hour,
      this.ohlcv_last_1_hour);

  factory CryptoMarketDataResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptoMarketDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoMarketDataResponseToJson(this);
}
