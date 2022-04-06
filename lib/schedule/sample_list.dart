import 'package:flutter/foundation.dart';

import 'package:rover_agenda/schedule/calendar/appointment_editor.dart';
import 'package:rover_agenda/schedule/calendar/getting_started.dart';
import 'package:rover_agenda/schedule/calendar/recurrence.dart';


/// Contains the output widget of sample
/// appropriate key and output widget mapped
Map<String, Function> getSampleWidget() {
  return <String, Function>{
    // Calendar Samples
    'getting_started_calendar': (Key key) => GettingStartedCalendar(key),
    'recurrence_calendar': (Key key) => RecurrenceCalendar(key),
    'appointment_editor_calendar': (Key key) => CalendarAppointmentEditor(key),
  };
}
