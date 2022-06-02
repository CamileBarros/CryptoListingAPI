import 'package:json_annotation/json_annotation.dart';

import 'crypto_data_response.dart';

part 'get_all_crypto_response.g.dart';

@JsonSerializable()
class GetAllCryptoResponse {
  final List<CryptoDataResponse> teste;

  GetAllCryptoResponse(this.teste);

  factory GetAllCryptoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllCryptoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllCryptoResponseToJson(this);
}
