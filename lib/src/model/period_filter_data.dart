class PeriodFilterList {
  String days;
  int periodDays;
  int x;

  PeriodFilterList(
      {required this.days, required this.periodDays, required this.x});
}

class DataPeriodFilter {
  final List<PeriodFilterList> periodDays = [
    PeriodFilterList(days: "5D", periodDays: 5, x: 1),
    PeriodFilterList(days: "10D", periodDays: 10, x: 1),
    PeriodFilterList(days: "15D", periodDays: 15, x: 1),
    PeriodFilterList(days: "30D", periodDays: 30, x: 1),
    PeriodFilterList(days: "50D", periodDays: 50, x: 1)
  ];
}
