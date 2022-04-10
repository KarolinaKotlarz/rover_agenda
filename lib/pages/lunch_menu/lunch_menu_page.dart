/// Package imports
import 'package:flutter/material.dart';

/// Calendar import
import 'package:syncfusion_flutter_calendar/calendar.dart';

/// Local imports
import '../../components/flyout_menu.dart';
import '../../globals.dart' as globals;

/// The class representing the lunch menu page
class LunchMenu extends StatelessWidget {
  const LunchMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lunch Menu'),
      ),
      drawer: const FlyoutMenu(),
      body: SfCalendar(
      /// The parameters of the calendar
        showDatePickerButton: true,
        view: CalendarView.day,
        showNavigationArrow: true,
        showCurrentTimeIndicator: false,
        timeSlotViewSettings: const TimeSlotViewSettings(
          timeRulerSize: 0,
          endHour: 10,
          timeIntervalHeight: -1,
        ),
        dataSource: _LunchDataSource(globals.lunches), /// Gets the lunches from the globals file
      ),

    );
  }
}

/// Converts list of lunches into a data source for the calendar
class _LunchDataSource extends CalendarDataSource {
  _LunchDataSource(List<Appointment> source) {
    appointments = source;
  }
}