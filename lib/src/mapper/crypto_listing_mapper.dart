import 'package:crypto_listing/shared/api/models/crypto_listing/get_all_crypto_response.dart';
import 'package:crypto_listing/src/model/crypto_listing_view_data.dart';

extension CryptoListingMapper on GetAllCryptoResponse {
  List<CryptoListingViewData> toViewData() {
    return teste
        .map((e) => CryptoListingViewData(
            name: e.name,
            symbol: e.symbol,
            slug: e.slug,
            marketCap: e.marketCap,
            marketData: e.marketData))
        .toList();
  }
}
