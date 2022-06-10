import 'package:charts_flutter/flutter.dart' as charts;
import 'package:crypto_listing/shared/themes/app_colors.dart';
import 'package:crypto_listing/src/model/charts_listing_view_data.dart';
import 'package:crypto_listing/src/screens/details_page/details_page_provider.dart';
import 'package:crypto_listing/src/screens/wallet_page/wallet_page_provider.dart';
import 'package:crypto_listing/src/useCases/crypto_listing_use_case.dart';
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
    final teste = ref.watch(chartsListingProvider);

    final dog = teste.whenOrNull(
      data: (data) {
        data.map((e) => ChartsListingViewData(values: e.values));
      },
    );
    List<charts.Series<List<dynamic>, num>> series = [
      charts.Series(
        id: "charts",
        data: dog,
        domainFn: (dynamic series, _) => series.values[0].length,
        measureFn: (dynamic series, _) => series.values[1].length,
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
