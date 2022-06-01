import 'package:crypto_listing/shared/api/crypto_listing_endpoint_provider.dart';
import 'package:crypto_listing/shared/repositories/crypto_listing_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cryptoListingRepositoryProvider = Provider((ref) {
  return CryptoListingRepository(
      cryptoListingEndpoint: ref.read(cryptoListingEndpointProvider));
});
