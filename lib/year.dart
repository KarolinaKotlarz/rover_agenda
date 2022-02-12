class Year {
  Year(
      {
        required this.semesterOneStart,
        required this.semesterTwoStart,
        required this.yearEnd,
        this.holidays
      }
      );

  DateTime semesterOneStart;
  DateTime semesterTwoStart;
  DateTime yearEnd;
  List<DateTime>? holidays;
}