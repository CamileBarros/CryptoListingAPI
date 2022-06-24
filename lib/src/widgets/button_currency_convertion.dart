import 'package:crypto_listing/shared/themes/app_colors.dart';
import 'package:crypto_listing/src/screens/currency_convertion_page/currency_convertion_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ButtonCurrencyConvertion extends ConsumerWidget {
  const ButtonCurrencyConvertion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          SizedBox(
              height: 44,
              width: 300,
              child: TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: AppColors.brandPrimary,
                    onSurface: AppColors.statusNeg),
                child: Text(AppLocalizations.of(context)!.nameBtnConvert),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const CurrencyConvertionPage()));
                },
              ))
        ],
      ),
    );
  }
}
