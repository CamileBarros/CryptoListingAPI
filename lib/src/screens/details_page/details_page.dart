import 'package:crypto_listing/shared/themes/app_colors.dart';
import 'package:crypto_listing/shared/themes/app_text_styles.dart';
import 'package:crypto_listing/src/model/listing_details_data.dart';
import 'package:crypto_listing/src/screens/details_page/details_page_provider.dart';
import 'package:crypto_listing/src/screens/wallet_page/wallet_page_provider.dart';
import 'package:crypto_listing/src/widgets/button_currency_convertion.dart';
import 'package:crypto_listing/src/widgets/buttons_period_charts.dart';
import 'package:crypto_listing/src/widgets/charts_bar.dart';
import 'package:crypto_listing/src/widgets/charts_line.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DetailsPage extends ConsumerWidget {
  final CryptoListingDetailsData info;

  const DetailsPage({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getCryptoListingProvider = ref.watch(cryptoListingProvidader(info));
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
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Text(
                      "${AppLocalizations.of(context)!.nameCurrency}\n${info.name}",
                      style: TextStyles.titlePrimary,
                    ),
                  ),
                  Center(
                    child:
                        show ? const CryptoLineChart() : const CryptoBarChart(),
                  ),
                  Text(AppLocalizations.of(context)!.nameInfo,
                      style: TextStyles.titleText),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(height: 1, color: Colors.grey),
                  ),
                  ListTile(
                      title: Text(info.name),
                      subtitle:
                          Text(AppLocalizations.of(context)!.nameActualValue),
                      trailing: Text(formatCurrency.format(info.actualValue))),
                  Column(children: [
                    ListTile(
                        title:
                            Text(AppLocalizations.of(context)!.nameMarketCap),
                        trailing: SizedBox(
                          width: 53,
                          height: 20,
                          child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: info.marketCap > 0
                                      ? AppColors.statusPos
                                      : AppColors.statusNeg,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, top: 2, right: 12),
                                child: Text("${info.marketCap}%"),
                              )),
                        )),
                    ListTile(
                      title: Text(AppLocalizations.of(context)!.nameMinValue),
                      trailing: Text(formatCurrency.format(info.lowValue)),
                    ),
                    ListTile(
                      title: Text(AppLocalizations.of(context)!.nameMaxValue),
                      trailing: Text(formatCurrency.format(info.highValue)),
                    ),
                    const ButtonCurrencyConvertion()
                  ])
                ]),
            error: (Object error, StackTrace? stackTrace) {},
            loading: () {}),
      ),
    );
  }
}
