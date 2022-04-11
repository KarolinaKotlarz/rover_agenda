/// Package imports
import 'package:flutter/foundation.dart';

/// Local imports
import 'calendar/appointment_editor.dart';
import 'calendar/getting_started.dart';
import 'calendar/schedule_page.dart';


/// Contains the output widget of sample
/// appropriate key and output widget mapped
Map<String, Function> getSampleWidget() {
  return <String, Function>{
    // Calendar Samples
    'getting_started_calendar': (Key key) => GettingStartedCalendar(key),
    'schedule_calendar': (Key key) => SchedulePage(key),
    'appointment_editor_calendar': (Key key) => CalendarAppointmentEditor(key),
  };
}
