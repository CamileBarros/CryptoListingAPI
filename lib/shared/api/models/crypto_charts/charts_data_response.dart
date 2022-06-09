import 'package:json_annotation/json_annotation.dart';

part 'charts_data_response.g.dart';

@JsonSerializable()
class ChartsDataResponse {
  final List<List<num>> values;
  // final String name;

  ChartsDataResponse(this.values);

  factory ChartsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ChartsDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChartsDataResponseToJson(this);
}
