import 'package:crypto_listing/shared/api/models/crypto_listing/crypto_market_cap_response.dart';
import 'package:crypto_listing/shared/api/models/crypto_listing/crypto_market_data_response.dart';

class CryptoListingViewData {
  final String name;
  final String symbol;
  final String slug;
  final CryptoMarketDataResponse marketData;
  final CryptoMarketCapResponse marketCap;

  CryptoListingViewData(
      {required this.name,
      required this.symbol,
      required this.slug,
      required this.marketData,
      required this.marketCap});
}
