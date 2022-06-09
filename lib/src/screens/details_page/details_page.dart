import 'package:crypto_listing/shared/themes/app_colors.dart';
import 'package:crypto_listing/shared/themes/app_text_styles.dart';
import 'package:crypto_listing/src/screens/details_page/details_page_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsPage extends ConsumerWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getCryptoListingProvider = ref.watch(cryptoListingProvider);
    final getChartsListingProvider = ref.watch(chartsListingProvider);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(AppLocalizations.of(context)!.nameDetails),
        backgroundColor: AppColors.primary,
        titleTextStyle: TextStyles.titleText,
      ),
      body: SingleChildScrollView(
        child: getChartsListingProvider.when(
            data: (data) => Column(
                  children: [
                    Column(
                      children:
                          data.map((e) => Text(e.values.toString())).toList(),
                    ),
                  ],
                ),
            // error: (error, stackTrace) => const Text('Ooops, erro!'),
            error: (error, stackTrace) {
              print(error);
            },
            loading: () => const CircularProgressIndicator()),
      ),
    );
  }
}
