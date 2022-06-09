import 'package:crypto_listing/shared/api/models/crypto_charts/charts_data_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_charts_response.g.dart';

@JsonSerializable()
class GetAllChartsResponse {
  final ChartsDataResponse data;

  GetAllChartsResponse(this.data);

  factory GetAllChartsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllChartsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllChartsResponseToJson(this);
}
