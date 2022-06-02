// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoDataResponse _$CryptoDataResponseFromJson(Map<String, dynamic> json) =>
    CryptoDataResponse(
      json['symbol'] as String,
      json['name'] as String,
      json['slug'] as String,
      CryptoMetricsResponse.fromJson(json['marketcap'] as Map<String, dynamic>),
      CryptoMetricsResponse.fromJson(
          json['market_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CryptoDataResponseToJson(CryptoDataResponse instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'slug': instance.slug,
      'marketcap': instance.marketcap,
      'market_data': instance.market_data,
    };
