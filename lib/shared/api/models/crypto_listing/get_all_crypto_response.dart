import 'package:json_annotation/json_annotation.dart';

import 'crypto_data_response.dart';

part 'get_all_crypto_response.g.dart';

@JsonSerializable()
class GetAllCryptoResponse {
  final List<CryptoDataResponse> data;

  GetAllCryptoResponse(this.data);

  factory GetAllCryptoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllCryptoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllCryptoResponseToJson(this);
}
