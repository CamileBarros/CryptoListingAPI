// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_metrics_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoMetricsResponse _$CryptoMetricsResponseFromJson(
        Map<String, dynamic> json) =>
    CryptoMetricsResponse(
      CryptoMarketDataResponse.fromJson(
          json['market_data'] as Map<String, dynamic>),
      CryptoMarketCapResponse.fromJson(
          json['marketcap'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CryptoMetricsResponseToJson(
        CryptoMetricsResponse instance) =>
    <String, dynamic>{
      'market_data': instance.market_data,
      'marketcap': instance.marketcap,
    };
