// import 'package:crypto_listing/src/model/period_filter_data.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class ButtonsPeriodCharts extends ConsumerStatefulWidget {
//   const ButtonsPeriodCharts({Key? key}) : super(key: key);

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _ButtonsPeriodChartsState();
// }

// class _ButtonsPeriodChartsState extends ConsumerState<ButtonsPeriodCharts> {
//   @override
//   Widget build(BuildContext context) {
//     final periodDays = ref.watch(DataPeriodFilter());
//     return Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       ...periodDays.map((e) => Row(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(0),
//                                 child: SizedBox(
//                                   height: 42,
//                                   width: 42,
//                                   child: TextButton(
//                                       style: TextButton.styleFrom(
//                                           primary: AppColors.textPrimary,
//                                           onSurface: Colors.blueGrey,
//                                           backgroundColor:
//                                               number == e.periodDays
//                                                   ? Colors.white
//                                                   : AppColors.primary),
//                                       onPressed: () {
//                                         setState(() {
//                                           _clicked(!click);
//                                           datasCharts =
//                                               dateFilter(e.periodDays);
//                                         });
//                                       },
//                                       child: Text(e.days)),
//   }
// }
