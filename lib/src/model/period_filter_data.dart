class PeriodFilterList {
  String days;
  int periodDays;

  PeriodFilterList({required this.days, required this.periodDays});
}

class DataPeriodFilter {
  final List<PeriodFilterList> periods = [
    PeriodFilterList(days: "5D", periodDays: 5),
    PeriodFilterList(days: "10D", periodDays: 10),
    PeriodFilterList(days: "15D", periodDays: 15),
    PeriodFilterList(days: "30D", periodDays: 30),
    PeriodFilterList(days: "50D", periodDays: 50)
  ];
}
