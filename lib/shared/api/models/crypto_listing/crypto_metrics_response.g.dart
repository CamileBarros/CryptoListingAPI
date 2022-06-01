// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_metrics_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoMetricsResponse _$CryptoMetricsResponseFromJson(
        Map<String, dynamic> json) =>
    CryptoMetricsResponse(
      (json['marketData'] as List<dynamic>)
          .map((e) =>
              CryptoMarketDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['marketCap'] as List<dynamic>)
          .map((e) =>
              CryptoMarketCapResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CryptoMetricsResponseToJson(
        CryptoMetricsResponse instance) =>
    <String, dynamic>{
      'marketData': instance.marketData,
      'marketCap': instance.marketCap,
    };
