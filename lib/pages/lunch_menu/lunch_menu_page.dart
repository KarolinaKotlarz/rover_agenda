/// Package imports
import 'package:flutter/material.dart';

/// Calendar import
import 'package:syncfusion_flutter_calendar/calendar.dart';

/// Local imports
import '../../components/flyout_menu.dart';
import '../../globals.dart' as globals;
import '../../globals.dart';
import '../../http_api_client.dart';

/// The class representing the lunch menu page
class LunchMenu extends StatefulWidget {
  LunchMenu({Key? key}) : super(key: key);

  @override
  State<LunchMenu> createState() => _LunchMenuState();
}

  class _LunchMenuState extends State<LunchMenu> {
    HttpApiClient _httpApiClientclient = new HttpApiClient();
    late Future<List<globals.LunchMenuItem>> futureLunchMenuItems;

    @override
    void initState() {
      super.initState();
      futureLunchMenuItems = _httpApiClientclient.fetchLunchMenuItems();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lunch Menu'),
      ),
      drawer: const FlyoutMenu(), // Imports the flyout menu
      body: FutureBuilder<List<globals.LunchMenuItem>>(
    future: futureLunchMenuItems,
    builder: (context, snapshot) {
    if (snapshot.hasData) {
    return SfCalendar(
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
        onTap: (CalendarTapDetails details) => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title:  Text(snapshot.requireData[0].itemName),
            content: Text(""),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
        dataSource: _getCalendarDataSource(snapshot.requireData) /*_LunchDataSource(duplicateLunches),*/ /// Gets the lunches from the globals file
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




/// Converts list of lunches into a data source for the calendar
class _LunchDataSource extends CalendarDataSource {
  _LunchDataSource(List<Appointment> source) {
    appointments = source;
  }
}

CalendarDataSource _getCalendarDataSource(List<LunchMenuItem> lunches) {
  List<Appointment> meetings = <Appointment>[];
  List<Color> colors = <Color>[];

  colors.add(Color(0xFF08454A));
  colors.add(Color(0xFFEC7926));
  colors.add(Color(0xFF0E8072));
  colors.add(Color(0xFFFFAD05));
  colors.add(Color(0xFF4FB06C));
  colors.add(Color(0xFFFFD835));

  for(int i = 0; i < lunches.length; i++)
    {
      meetings.add(Appointment(
        startTime: lunches[i].startTime,
        endTime: lunches[i].endTime,
        subject: lunches[i].itemName,
        color: colors[i],
        recurrenceRule: 'FREQ=DAILY',
      ));
    }
/*  meetings.add(globals.LunchMenuItem(
      itemName: 'meeting',
      startTime: DateTime(2022, 6, 24, 3),
      endTime: DateTime(2022, 6, 24, 4),
      color: Colors.green,));*/

  return _LunchDataSource(meetings);
}

/*
class _LunchDataSource extends CalendarDataSource {
  _LunchDataSource(List<globals.LunchMenuItem> source){
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].startTime;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].endTime;
  }

  @override
  bool isAllDay(int index) {
    return false;
  }

  @override
  String getSubject(int index) {
    return appointments![index].itemName;
  }

  @override
  String getStartTimeZone(int index) {
    return 'US/Eastern';
  }

  @override
  String getEndTimeZone(int index) {
    return 'US/Eastern';
  }

  @override
  Color getColor(int index) {
    return appointments![index].color;
  }
}*/
