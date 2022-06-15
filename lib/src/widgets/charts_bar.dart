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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool show = ref.watch(visible); //bool of animation

    final getCryptoListingProvider = ref.watch(chartsListingProvider);
    List<dynamic> barChart = [];
    getCryptoListingProvider.whenOrNull(
      data: (data) {
        barChart =
            data.map((e) => ChartsListingViewData(values: e.values)).toList();
      },
    );

    DateTime getNextWeekDay(int weekDay) {
      DateTime now = DateTime.now();

      int remainDays = weekDay;

      return now.subtract(const Duration(days: 1));
    }

    var days = 15;
    var teste = DateTime.now();
    var teste2 = teste.subtract(const Duration(days: 1));
    var value = [];
    for (var i = 0; i < days; i++) {
      value.add([barChart[0].values[i][1], teste2]);
    }

    List<charts.Series<dynamic, DateTime>> series = [
      charts.Series(
        id: "charts",
        data: value,
        domainFn: (dynamic series, _) => series[1],
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
                  child: charts.TimeSeriesChart(
                    series,
                    animate: ref.read(visible.state).state = show,
                    defaultRenderer: charts.BarRendererConfig<DateTime>(),
                    defaultInteractions: false,
                    behaviors: [
                      charts.SelectNearest(),
                      charts.DomainHighlighter()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
