// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charts_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChartsDataResponse _$ChartsDataResponseFromJson(Map<String, dynamic> json) =>
    ChartsDataResponse(
      (json['values'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as num).toList())
          .toList(),
    );

Map<String, dynamic> _$ChartsDataResponseToJson(ChartsDataResponse instance) =>
    <String, dynamic>{
      'values': instance.values,
    };
