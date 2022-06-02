// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_crypto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCryptoResponse _$GetAllCryptoResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllCryptoResponse(
      (json['teste'] as List<dynamic>)
          .map((e) => CryptoDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllCryptoResponseToJson(
        GetAllCryptoResponse instance) =>
    <String, dynamic>{
      'teste': instance.teste,
    };
