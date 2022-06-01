import 'package:crypto_listing/shared/api/models/crypto_listing/get_all_crypto_response.dart';
import 'package:crypto_listing/src/model/crypto_listing_view_data.dart';

extension CryptoListingMapper on GetAllCryptoResponse {
  List<CryptoListingViewData> toViewData() {}
}
