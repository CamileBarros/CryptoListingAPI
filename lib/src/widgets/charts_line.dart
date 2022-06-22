/// Timeseries chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:crypto_listing/shared/themes/app_colors.dart';
import 'package:crypto_listing/src/model/period_filter_data.dart';
import 'package:crypto_listing/src/screens/wallet_page/wallet_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CryptoLineChart extends ConsumerStatefulWidget {
  final List<dynamic> teste;
  const CryptoLineChart({Key? key, required this.teste}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CryptoLineChartState();
}

class _CryptoLineChartState extends ConsumerState<CryptoLineChart> {
  @override
  Widget build(BuildContext context) {
    bool show = ref.watch(visible);
    //bool of animation

    final periodDays = DataPeriodFilter().periods;
    // final getCryptoListingProvider = ref.watch(chartsListingProvider);
    // List<dynamic> chartLine = [];
    // getCryptoListingProvider.whenOrNull(
    //   data: (data) {
    //     chartLine =
    //         data.map((e) => ChartsListingViewData(values: e.values)).toList();
    //   },
    // );

    // num valueLogic = 15;
    // num day = 0;
    // List<dynamic> callback(num valueLogic) {
    //   final List<dynamic> valuesChart = [];
    //   for (var i = 0; i < valueLogic; i++) {
    //     valuesChart.add([chartLine[0].values[i][1], day + i]);

    //     day = valueLogic;
    //   }
    //   return valuesChart;
    // }

    List<charts.Series<dynamic, num>> series = [
      charts.Series(
        id: "charts",
        data: widget.teste,
        domainFn: (dynamic series, _) => series[1],
        measureFn: (dynamic series, _) => series[0],
        colorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(AppColors.linePrimary),
      )
    ];
    print(' ler $widget.teste');
    return Container(
        height: 330,
        padding: const EdgeInsets.only(right: 25, left: 25, top: 25),
        child: Card(
            child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(children: [
            Expanded(
              child: charts.LineChart(
                series,
                animate: ref.read(visible.state).state = show,
                domainAxis: const charts.NumericAxisSpec(
                  tickProviderSpec:
                      charts.BasicNumericTickProviderSpec(zeroBound: false),
                ),
              ),
            ),
          ]),
        )));
  }
}
