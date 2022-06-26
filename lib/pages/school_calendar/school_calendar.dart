/// Package imports
import 'package:flutter/material.dart';
import 'package:instabug_flutter/Instabug.dart';

/// Calendar import
import 'package:syncfusion_flutter_calendar/calendar.dart';

/// Local imports
import '../../components/flyout_menu.dart';
import '../../globals.dart' as globals;
import '../../http_api_client.dart';

/// The class representing the school calendar page
class SchoolCalendar extends StatefulWidget {
  SchoolCalendar({Key? key}) : super(key: key);

  @override
  State<SchoolCalendar> createState() => _SchoolCalendarState();
}

class _SchoolCalendarState extends State<SchoolCalendar> {

  HttpApiClient _httpApiClientclient = new HttpApiClient();
  late Future<List<globals.SchoolEvent>> futureSchoolEvents;

  @override
  void initState() {
    super.initState();
    futureSchoolEvents = _httpApiClientclient.fetchSchoolEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Calendar'),
      ),
      drawer: const FlyoutMenu(),
      body: FutureBuilder<List<globals.SchoolEvent>>(
    future: futureSchoolEvents,
    builder: (context, snapshot) {
    if (snapshot.hasData) {
    return SfCalendar(
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
        dataSource: _getCalendarDataSource(snapshot.requireData), /// Gets the school events from the globals file
      );
      } else if (snapshot.hasError) {
      return Text('${snapshot.error}');
      }
      // By default, show a loading spinner.
      return Center(child: CircularProgressIndicator(),);
    },
      )
    );
  }
}

/// Converts list of school events into a data source for the calendar
class _SchoolCalendarDataSource extends CalendarDataSource {
  _SchoolCalendarDataSource(List<Appointment> source) {
    appointments = source;
  }
}


CalendarDataSource _getCalendarDataSource(List<globals.SchoolEvent> schoolEvents) {
  List<Appointment> meetings = <Appointment>[];
  List<Color> colors = <Color>[];

  colors.add(Color(0xFF08454A));
  colors.add(Color(0xFF0E8072));
  colors.add(Color(0xFF4FB06C));
  colors.add(Color(0xFFFFD835));
  colors.add(Color(0xFFFFAD05));
  colors.add(Color(0xFFEC7926));
  colors.add(Color(0xFF23B5D3));
  colors.add(Color(0xFF006E90));
  colors.add(Color(0xFF2C2C54));
  colors.add(Color(0xFF006E90));
  colors.add(Color(0xFF23B5D3));
  colors.add(Color(0xFF4FB06C));
  colors.add(Color(0xFFFFD835));
  colors.add(Color(0xFFFFAD05));
  colors.add(Color(0xFFEC7926));
  colors.add(Color(0xFF23B5D3));
  colors.add(Color(0xFF006E90));
  colors.add(Color(0xFF2C2C54));
  colors.add(Color(0xFF08454A));
  colors.add(Color(0xFF0E8072));
  colors.add(Color(0xFF4FB06C));
  colors.add(Color(0xFFFFD835));
  colors.add(Color(0xFFFFAD05));
  colors.add(Color(0xFFEC7926));
  colors.add(Color(0xFF23B5D3));
  colors.add(Color(0xFF006E90));
  colors.add(Color(0xFF2C2C54));


  for(int i = 0; i < schoolEvents.length; i++)
  {
    meetings.add(Appointment(
      startTime: schoolEvents[i].startTime,
      endTime: schoolEvents[i].endTime,
      subject: schoolEvents[i].subject,
      color: colors[i],
      //recurrenceRule: 'FREQ=DAILY',
    ));
  }

  return _SchoolCalendarDataSource(meetings);
}