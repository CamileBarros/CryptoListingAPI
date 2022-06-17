import 'package:crypto_listing/shared/themes/app_colors.dart';
import 'package:crypto_listing/src/model/period_filter_data.dart';
import 'package:crypto_listing/src/screens/details_page/details_page_provider.dart';
import 'package:crypto_listing/src/screens/wallet_page/wallet_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonsPeriodCharts extends ConsumerStatefulWidget {
  const ButtonsPeriodCharts({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ButtonsPeriodChartsState();
}

class _ButtonsPeriodChartsState extends ConsumerState<ButtonsPeriodCharts> {
  @override
  Widget build(BuildContext context) {
    bool show = ref.watch(visible);
    final getCryptoListingProvider = ref.watch(chartsListingProvider);
    final periodDays = DataPeriodFilter().periodDays;
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...periodDays.map((e) => Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: SizedBox(
                      height: 42,
                      width: 42,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              primary: AppColors.textPrimary,
                              onSurface: Colors.blueGrey,
                              backgroundColor: Colors.white),
                          onPressed: () {
                            ref.read(visible.state).state = !show;
                            getCryptoListingProvider.whenOrNull(
                              data: (data) {
                                return e.periodDays;
                              },
                            );
                          },
                          // {
                          //   setState(() {
                          //     _clicked(!click);
                          //     datasCharts =
                          //         dateFilter(e.periodDays);
                          //   });
                          // },
                          child: Text(e.days)),
                    ),
                  ),
                ],
              ))
        ]);
  }
}
