import 'package:json_annotation/json_annotation.dart';

part 'crypto_value_day_response.g.dart';

@JsonSerializable()
class CryptoValueDayResponse {
  final num high;
  final num low;

  CryptoValueDayResponse(this.high, this.low);

  factory CryptoValueDayResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptoValueDayResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoValueDayResponseToJson(this);
}
