import 'package:crypto_listing/shared/themes/app_colors.dart';
import 'package:crypto_listing/shared/themes/app_images.dart';
import 'package:crypto_listing/shared/themes/app_text_styles.dart';
import 'package:crypto_listing/src/screens/details_page/details_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeMovement extends ConsumerWidget {
  const HomeMovement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getCryptoListingProvider =
        ref.watch(cryptoListingProvidader(cryptoListingProvidader));
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Container(
              height: 230,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: AppColors.primary))),
              child: Center(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.nameMovement,
                      style: TextStyles.titlePrimary,
                    ),
                  ),
                ),
              ))),
      body: SingleChildScrollView(
          child: getCryptoListingProvider.when(
              data: (data) => Column(children: [
                    Column(
                      children: data
                          .map((e) => Container(
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1,
                                            color: AppColors.primary))),
                                child: ListTile(
                                  leading: Container(
                                    height: 48,
                                    width: 48,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                AppImages.iconTransition))),
                                  ),
                                  title: Text(e.symbol),
                                ),
                              ))
                          .toList(),
                    ),
                  ]),
              error: (Object error, StackTrace? stackTrace) =>
                  Text(AppLocalizations.of(context)!.textError),
              loading: () => const CircularProgressIndicator())),
    );
  }
}
