import 'package:crypto_listing/shared/api/models/crypto_listing/crypto_metrics_response.dart';

class CryptoListingViewData {
  final String name;
  final String symbol;
  final String slug;
  final CryptoMetricsResponse market_data;
  final CryptoMetricsResponse marketcap;

  CryptoListingViewData(
      {required this.name,
      required this.symbol,
      required this.slug,
      required this.market_data,
      required this.marketcap});
}
