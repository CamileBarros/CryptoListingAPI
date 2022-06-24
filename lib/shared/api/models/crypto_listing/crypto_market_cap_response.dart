import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'crypto_market_cap_response.g.dart';

@JsonSerializable()
class CryptoMarketCapResponse {
  // ignore: non_constant_identifier_names
  final num marketcap_dominance_percent;

  CryptoMarketCapResponse(this.marketcap_dominance_percent);

  factory CryptoMarketCapResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptoMarketCapResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoMarketCapResponseToJson(this);
}
