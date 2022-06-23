import 'package:crypto_listing/shared/themes/app_colors.dart';
import 'package:crypto_listing/shared/themes/app_images.dart';
import 'package:crypto_listing/shared/themes/app_text_styles.dart';
import 'package:crypto_listing/src/model/listing_route_details_data.dart';
import 'package:crypto_listing/src/screens/details_page/details_page.dart';
import 'package:crypto_listing/src/screens/details_page/details_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'wallet_page_provider.dart';

class HomeWalletPage extends ConsumerStatefulWidget {
  const HomeWalletPage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeWalletPage> createState() => _HomeWalletPageState();
}

class _HomeWalletPageState extends ConsumerState<HomeWalletPage> {
  final formatCurrency = NumberFormat.simpleCurrency();
  @override
  Widget build(BuildContext context) {
    final getCryptoListingProvider =
        ref.watch(cryptoListingProvidader(cryptoListingProvidader));
    bool show = ref.watch(visible);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(200),
          child: Container(
              height: 230,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: AppColors.primary))),
              child: Center(
                child: ListTile(
                  title: Text(
                    AppLocalizations.of(context)!.nameWallet,
                    style: TextStyles.titlePrimary,
                  ),
                  subtitle: AnimatedOpacity(
                    opacity: show ? 1 : 0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: Text(
                      '5000',
                      style: TextStyles.titlePrimary,
                    ),
                  ),
                  trailing: IconButton(
                      icon: const Icon(
                        Icons.visibility,
                        color: AppColors.textPrimary,
                      ),
                      alignment: Alignment.topLeft,
                      onPressed: () => ref.read(visible.state).state = !show),
                ),
              )),
        ),
        body: SingleChildScrollView(
            child: getCryptoListingProvider.when(
                data: (data) => Column(
                      children: [
                        Column(
                            children: data
                                .map(
                                  (e) => Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color: AppColors.primary))),
                                      child: ListTile(
                                          leading: Container(
                                            height: 48,
                                            width: 48,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(48),
                                                image: const DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(
                                                        AppImages.iconBTC))),
                                          ),
                                          title: Text(e.symbol),
                                          subtitle: Text(e.name),
                                          trailing: AnimatedOpacity(
                                              opacity: show ? 1 : 0,
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              curve: Curves.easeInOut,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(formatCurrency.format(e
                                                      .metrics
                                                      .market_data
                                                      .price_usd)),
                                                  SizedBox(
                                                    width: 53,
                                                    height: 20,
                                                    child: DecoratedBox(
                                                      decoration: BoxDecoration(
                                                          color: e
                                                                      .metrics
                                                                      .market_data
                                                                      .percent_change_usd_last_1_hour >
                                                                  0
                                                              ? AppColors
                                                                  .statusPos
                                                              : AppColors
                                                                  .statusNeg,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 12,
                                                                top: 2,
                                                                right: 12),
                                                        child: Text(e
                                                            .metrics
                                                            .market_data
                                                            .percent_change_usd_last_1_hour
                                                            .toString()),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )),
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetailsPage(
                                                          info: CryptoListingDetailsData(
                                                              name: e.name,
                                                              marketCap: e
                                                                  .metrics
                                                                  .market_data
                                                                  .percent_change_usd_last_1_hour,
                                                              highValue: e
                                                                  .metrics
                                                                  .market_data
                                                                  .ohlcv_last_1_hour
                                                                  .high,
                                                              lowValue: e
                                                                  .metrics
                                                                  .market_data
                                                                  .ohlcv_last_1_hour
                                                                  .low,
                                                              actualValue: e
                                                                  .metrics
                                                                  .market_data
                                                                  .price_usd),
                                                        )));
                                          })),
                                )
                                .toList()),
                      ],
                    ),
                error: (Object error, StackTrace? stackTrace) =>
                    const Text('Ops! Algo está errado!'),
                loading: () => const CircularProgressIndicator())));
  }
}
