import 'package:crypto_listing/shared/themes/app_colors.dart';
import 'package:crypto_listing/shared/themes/app_text_styles.dart';
import 'package:crypto_listing/src/model/charts_listing_view_data.dart';
import 'package:crypto_listing/src/model/listing_route_details_data.dart';
import 'package:crypto_listing/src/model/period_filter_data.dart';
import 'package:crypto_listing/src/screens/details_page/details_page_provider.dart';
import 'package:crypto_listing/src/screens/wallet_page/wallet_page_provider.dart';
import 'package:crypto_listing/src/widgets/button_change_chart.dart';
import 'package:crypto_listing/src/widgets/button_currency_convertion.dart';
import 'package:crypto_listing/src/widgets/charts_bar.dart';
import 'package:crypto_listing/src/widgets/charts_line.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DetailsPage extends ConsumerStatefulWidget {
  final CryptoListingDetailsData info;
  const DetailsPage({Key? key, required this.info}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailsPageState();
}

class _DetailsPageState extends ConsumerState<DetailsPage> {
  List<dynamic> chartsData = [];
  num periodDay = 10;
  num day = 0;

  @override
  Widget build(BuildContext context) {
    final getCryptoListingProvider = ref.watch(chartsListingProvider);
    getCryptoListingProvider.whenOrNull(
      data: (data) {
        chartsData =
            data.map((e) => ChartsListingViewData(values: e.values)).toList();
      },
    );

    List<dynamic> funDatasCharts(num periodDay) {
      final List<dynamic> valuesOfCharts = [];
      for (var i = 0; i < periodDay; i++) {
        valuesOfCharts.add([chartsData[0].values[i][1], day + i]);

        day = periodDay;
      }
      return valuesOfCharts;
    }

    chartsData = funDatasCharts(periodDay);

    final periodDays = DataPeriodFilter().periods;
    final formatCurrency = NumberFormat.simpleCurrency();
    bool show = ref.watch(visible);
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(AppLocalizations.of(context)!.nameDetails),
          backgroundColor: AppColors.primary,
          titleTextStyle: TextStyles.titleText,
        ),
        body: SingleChildScrollView(
          child: getCryptoListingProvider.when(
            data: (data) => Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 31, top: 20, bottom: 10),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "${AppLocalizations.of(context)!.nameCurrency}\n${widget.info.name}",
                    style: TextStyles.titlePrimary,
                  ),
                ),
              ),
              Center(
                child: show
                    ? CryptoLineChart(
                        data: chartsData,
                      )
                    : CryptoBarChart(data: chartsData),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 0),
                child: Card(
                  color: AppColors.primary,
                  child: Row(
                    children: [
                      ...periodDays.map((e) => Row(
                            children: [
                              SizedBox(
                                height: 42,
                                width: 42,
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                        textStyle: TextStyles.smallText,
                                        primary: AppColors.textSecondary,
                                        onSurface:
                                            AppColors.backgroundSecundary,
                                        backgroundColor:
                                            periodDay == e.periodDays
                                                ? AppColors.backgroundSecundary
                                                : AppColors.primary),
                                    onPressed: () {
                                      setState(() {
                                        periodDay = e.periodDays;
                                      });
                                    },
                                    child: Text(e.days)),
                              )
                            ],
                          )),
                      const ButtonChangeChart()
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 31, top: 20, bottom: 10),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(AppLocalizations.of(context)!.nameInfo,
                      style: TextStyles.titleText),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(height: 1, color: Colors.grey),
              ),
              ListTile(
                  title: Text(widget.info.name),
                  subtitle: Text(AppLocalizations.of(context)!.nameActualValue),
                  trailing:
                      Text(formatCurrency.format(widget.info.actualValue))),
              Column(children: [
                ListTile(
                    title: Text(AppLocalizations.of(context)!.nameMarketCap),
                    trailing: SizedBox(
                      width: 53,
                      height: 20,
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: widget.info.marketCap > 0
                                  ? AppColors.statusPos
                                  : AppColors.statusNeg,
                              borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 12, top: 2, right: 12),
                            child: Text("${widget.info.marketCap}%"),
                          )),
                    )),
                ListTile(
                  title: Text(AppLocalizations.of(context)!.nameMinValue),
                  trailing: Text(formatCurrency.format(widget.info.lowValue)),
                ),
                ListTile(
                  title: Text(AppLocalizations.of(context)!.nameMaxValue),
                  trailing: Text(formatCurrency.format(widget.info.highValue)),
                ),
                const ButtonCurrencyConvertion()
              ])
            ]),
            error: (Object error, StackTrace? stackTrace) =>
                Text(AppLocalizations.of(context)!.textError),
            loading: () => const CircularProgressIndicator(),
          ),
        ));
  }
}
