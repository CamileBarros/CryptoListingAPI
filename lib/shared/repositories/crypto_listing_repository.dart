import 'package:crypto_listing/shared/api/crypto_listing_endpoint.dart';
import 'package:crypto_listing/shared/api/models/crypto_listing/get_all_crypto_response.dart';

class CryptoListingRepository {
  final CryptoListingEndpoint cryptoListingEndpoint;

  CryptoListingRepository({required this.cryptoListingEndpoint});

  Future<GetAllCryptoResponse> getAllCryptoInfo() async {
    final result = await cryptoListingEndpoint.getAllCryptoInfo();
    return GetAllCryptoResponse.fromJson(result.data);
  }
}
