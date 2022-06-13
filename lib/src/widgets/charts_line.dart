import 'package:charts_flutter/flutter.dart' as charts;
import 'package:crypto_listing/shared/themes/app_colors.dart';
import 'package:crypto_listing/src/model/charts_listing_view_data.dart';
import 'package:crypto_listing/src/screens/details_page/details_page_provider.dart';
import 'package:crypto_listing/src/screens/wallet_page/wallet_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';

class CryptoLineChart extends ConsumerWidget {
  // final bool animate;
  const CryptoLineChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final formatCurrency = NumberFormat.simpleCurrency();
    bool show = ref.watch(visible);
    final getCryptoListingProvider = ref.watch(chartsListingProvider);
    List<dynamic> chartLine = [];
    getCryptoListingProvider.whenOrNull(
      data: (data) {
        chartLine =
            data.map((e) => ChartsListingViewData(values: e.values)).toList();
        // print("carlosss ${dog[0].values[0][5]}");
      },
    );
    // final day = DateTime.now().subtract(const Duration(days: 1));
    // var dias = 5;
    // var value2 = [];

    // for (var i = 0; i < dias; i++) {
    //   value2.add([dog[0].values[i][5], dog[0].values[i][3]]);
    var days = 10;
    var value = [];
    for (var i = 0; i < days; i++) {
      value.add([chartLine[0].values[i][1], chartLine[0].values[i][1]]);
    }

    // print("socorro $value2ß");

    List<charts.Series<dynamic, num>> series = [
      charts.Series(
        id: "charts",
        data: value,
        domainFn: (dynamic series, _) => series[0],
        measureFn: (dynamic series, _) => series[1],
        colorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(AppColors.linePrimary),
      )
    ];

    return Container(
      height: 330,
      padding: const EdgeInsets.only(right: 25, left: 25, top: 25),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: <Widget>[
              // Text(
              //   formatCurrency.format(data.actualCrypto),
              //   style: TextStyles.titlePrimary,
              // ),
              Expanded(
                  child: charts.LineChart(
                series,
                animate: ref.read(visible.state).state = show,
                domainAxis: const charts.NumericAxisSpec(
                  tickProviderSpec:
                      charts.BasicNumericTickProviderSpec(zeroBound: false),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
