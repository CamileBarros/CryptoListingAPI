/// Timeseries chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:crypto_listing/shared/themes/app_colors.dart';
import 'package:crypto_listing/src/model/charts_listing_view_data.dart';
import 'package:crypto_listing/src/screens/details_page/details_page_provider.dart';
import 'package:crypto_listing/src/screens/wallet_page/wallet_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CryptoBarChart extends ConsumerWidget {
  const CryptoBarChart({Key? key}) : super(key: key);

  //valueLogic passa a ser aq

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool show = ref.watch(visible); //bool of animation

    final getCryptoListingProvider = ref.watch(chartsListingProvider);
    List<dynamic> chartBar = [];
    getCryptoListingProvider.whenOrNull(
      data: (data) {
        chartBar =
            data.map((e) => ChartsListingViewData(values: e.values)).toList();
      },
    );

    num day = 1;

    var valueLogic = 30;
    var valuesChart = [];
    for (var i = 0; i < valueLogic; i++) {
      valuesChart.add([chartBar[1].values[i][1], day + i]);
    }

    List<charts.Series<dynamic, String>> series = [
      charts.Series(
        id: "charts",
        data: valuesChart,
        domainFn: (dynamic series, _) => series[1].toString(),
        measureFn: (dynamic series, _) => series[0],
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
              children: [
                Expanded(
                  child: charts.BarChart(
                    series,
                    animate: ref.read(visible.state).state = show,
                  ),
                ),
                const Center(
                    // child: ButtonsPeriodCharts(teste: (flor) => callback(flor)),
                    )
              ],
            ),
          ),
        ));
  }
}
