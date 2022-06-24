// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_market_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoMarketDataResponse _$CryptoMarketDataResponseFromJson(
        Map<String, dynamic> json) =>
    CryptoMarketDataResponse(
      json['price_usd'] as num,
      json['percent_change_usd_last_1_hour'] as num,
      CryptoValueDayResponse.fromJson(
          json['ohlcv_last_1_hour'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CryptoMarketDataResponseToJson(
        CryptoMarketDataResponse instance) =>
    <String, dynamic>{
      'price_usd': instance.price_usd,
      'percent_change_usd_last_1_hour': instance.percent_change_usd_last_1_hour,
      'ohlcv_last_1_hour': instance.ohlcv_last_1_hour,
    };
