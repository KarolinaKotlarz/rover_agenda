/// Package imports
import 'package:flutter/material.dart';
import 'package:instabug_flutter/Instabug.dart';

/// Calendar import
import 'package:syncfusion_flutter_calendar/calendar.dart';

/// Local imports
import '../../components/flyout_menu.dart';
import '../../globals.dart' as globals;

/// The class representing the school calendar page
class SchoolCalendar extends StatelessWidget {
  const SchoolCalendar({Key? key}) : super(key: key);

  /// Starts Instabug
  void initState() {
    Instabug.start('76ed198e8e1d4438e3ff5b8b152d6e60', [InvocationEvent.shake]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Calendar'),
      ),
      drawer: const FlyoutMenu(),
      body: SfCalendar(
        /// The parameters of the calendar
        showDatePickerButton: true,
        view: CalendarView.month,
        showNavigationArrow: true,
        allowViewNavigation: true,
        showCurrentTimeIndicator: true,
        allowedViews: const <CalendarView>
        [
          CalendarView.day,
          CalendarView.week,
          CalendarView.month,
        ],
        monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          showAgenda: true,
        ),
        dataSource: _SchoolCalendarDataSource(globals.schoolEvents), /// Gets the school events from the globals file
      ),
    );
  }
}

/// Converts list of school events into a data source for the calendar
class _SchoolCalendarDataSource extends CalendarDataSource {
  _SchoolCalendarDataSource(List<Appointment> source) {
    appointments = source;
  }
}