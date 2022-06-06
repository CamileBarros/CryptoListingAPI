import 'package:crypto_listing/shared/themes/app_colors.dart';
import 'package:crypto_listing/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import 'wallet_page_provider.dart';

class HomeWalletPage extends ConsumerStatefulWidget {
  const HomeWalletPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<HomeWalletPage> createState() => _HomeWalletPageState();
}

class _HomeWalletPageState extends ConsumerState<HomeWalletPage> {
  final formatCurrency = NumberFormat.simpleCurrency();
  int x = 2; // part of logic of colors of the period's button

  @override
  Widget build(BuildContext context) {
    // void _visibility(bool visibility) {
    //   setState(() => show = visibility);
    // }

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
                      formatCurrency
                          .format(containerDatas[0].cryptoInfo.valueWallet),
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
          child: Column(
            children: [
              ...containerDatas
                  .map(
                    (e) => Column(
                      children: [
                        Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: AppColors.primary))),
                            child: ListTile(
                                leading: Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(48),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              e.iconCrypto.assetName))),
                                ),
                                title: Text(e.initialsCrypto),
                                subtitle: Text(e.nameCrypto),
                                trailing: AnimatedOpacity(
                                    opacity: show ? 1 : 0,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(formatCurrency
                                            .format(e.investedCrypto)),
                                        SizedBox(
                                          width: 53,
                                          height: 20,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                color: e.dayVariation > 0
                                                    ? AppColors.statusPos
                                                    : AppColors.statusNeg,
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12, top: 2, right: 12),
                                              child: Text(
                                                  e.dayVariation.toString() +
                                                      "%"),
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => HomeDetails(
                                  //               initials: e.initialsCrypto,
                                  //               name: e.nameCrypto,
                                  //               variation: e.dayVariation,
                                  //               invested: e.investedCrypto,
                                  //               min: e.cryptoInfo.valueMin,
                                  //               max: e.cryptoInfo.valueMax,
                                  //               actualCrypto: e.cryptoInfo
                                  //                   .actualValueCrypto,
                                  //               logicOfBtn: x,
                                  //             )));
                                })),
                      ],
                    ),
                  )
                  .toList(),
            ],
          ),
        ));
  }
}

