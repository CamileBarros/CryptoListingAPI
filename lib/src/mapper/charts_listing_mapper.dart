import 'package:crypto_listing/shared/api/models/crypto_charts/get_all_charts_response.dart';
import 'package:crypto_listing/src/model/charts_listing_view_data.dart';

extension ChartsListingMapper on GetAllChartsResponse {
  List<ChartsListingViewData> toViewDataCharts() {
    return data.values
        .map((e) => ChartsListingViewData(values: data.values))
        .toList();
  }
}
