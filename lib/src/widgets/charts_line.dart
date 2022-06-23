import 'package:charts_flutter/flutter.dart' as charts;
import 'package:crypto_listing/shared/themes/app_colors.dart';
import 'package:crypto_listing/shared/themes/app_text_styles.dart';
import 'package:crypto_listing/src/screens/wallet_page/wallet_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CryptoLineChart extends ConsumerStatefulWidget {
  final List<dynamic> data;
  const CryptoLineChart({Key? key, required this.data}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CryptoLineChartState();
}

class _CryptoLineChartState extends ConsumerState<CryptoLineChart> {
  final formatCurrency = NumberFormat.simpleCurrency();
  @override
  Widget build(BuildContext context) {
    ref.watch(valueWallet);
    bool show = ref.watch(visible); //bool of animation

    List<charts.Series<dynamic, num>> series = [
      charts.Series(
        id: "charts",
        data: widget.data,
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
            color: AppColors.primary,
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Column(children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    formatCurrency.format(ref.read(valueWallet)),
                    style: TextStyles.titlePrimary,
                  ),
                ),
                Expanded(
                  child: charts.LineChart(
                    series,
                    animate: ref.read(visible.state).state = show,
                    primaryMeasureAxis: const charts.NumericAxisSpec(
                        renderSpec: charts.NoneRenderSpec()),
                    domainAxis: const charts.NumericAxisSpec(
                        showAxisLine: true,
                        renderSpec: charts.NoneRenderSpec()),
                  ),
                ),
              ]),
            )));
  }
}
