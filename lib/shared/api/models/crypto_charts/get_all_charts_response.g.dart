// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_charts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllChartsResponse _$GetAllChartsResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllChartsResponse(
      ChartsDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllChartsResponseToJson(
        GetAllChartsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
