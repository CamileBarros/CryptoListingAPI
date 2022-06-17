import 'package:crypto_listing/shared/themes/app_colors.dart';
import 'package:crypto_listing/shared/themes/app_text_styles.dart';
import 'package:crypto_listing/src/model/listing_details_data.dart';
import 'package:crypto_listing/src/screens/details_page/details_page_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsPage extends ConsumerWidget {
  final CryptoListingDetailsData info;

  const DetailsPage({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getCryptoListingProvider = ref.watch(teste(info));
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(AppLocalizations.of(context)!.nameDetails),
        backgroundColor: AppColors.primary,
        titleTextStyle: TextStyles.titleText,
      ),
      body: SingleChildScrollView(
        child: getCryptoListingProvider.when(
            data: (data) => Text(info.slug),
            error: (Object error, StackTrace? stackTrace) {},
            loading: () {}),
      ),
    );
  }
}
