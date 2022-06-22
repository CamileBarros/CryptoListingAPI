// import 'package:crypto_listing/shared/themes/app_colors.dart';
// import 'package:crypto_listing/src/model/period_filter_data.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'button_change_chart.dart';

// class ButtonsPeriodCharts extends ConsumerStatefulWidget {
//   final Function teste;
//   const ButtonsPeriodCharts({Key? key, required this.teste}) : super(key: key);

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _ButtonsPeriodChartsState();
// }

// class _ButtonsPeriodChartsState extends ConsumerState<ButtonsPeriodCharts> {
//   List<dynamic> teste2 = <dynamic>[];
//   @override
//   Widget build(BuildContext context) {
//     final periodDays = DataPeriodFilter().periods;
//     return Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           ...periodDays.map((e) => Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(0),
//                     child: SizedBox(
//                       height: 42,
//                       width: 42,
//                       child: TextButton(
//                           style: TextButton.styleFrom(
//                               primary: AppColors.textPrimary,
//                               onSurface: Colors.blueGrey,
//                               backgroundColor: Colors.white),
//                           onPressed: () {
//                             setState(() {
//                               teste2 = widget.teste(e.periodDays);
//                             });
//                           },
//                           // getCryptoListingProvider.whenOrNull(
//                           //   data: (data) {
//                           //     return e.periodDays;
//                           // funcao(e.periodDays)
//                           //   },
//                           // );
//                           // {
//                           //   setState(() {
//                           //     _clicked(!click);
//                           //     datasCharts =
//                           //         dateFilter(e.periodDays);
//                           //   });
//                           // },
//                           child: Text(e.days)),
//                     ),
//                   ),
//                 ],
//               )),
//           const ButtonChangeChart(),
//         ]);
//   }
// }
