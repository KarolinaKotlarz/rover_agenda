///Dart imports
import 'dart:math';

///Package imports
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

///calendar import
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../flyout_menu.dart';
///Local import
import '../model/sample_view.dart';
import 'appointment_editor.dart';
import 'getting_started.dart';
import '../../../../globals.dart' as globals;


/// Widget class of recurrence calendar
class SchedulePage extends SampleView {
  /// Creates recurrence calendar
  const SchedulePage(Key key) : super(key: key);

  @override
  RecurrenceCalendarState createState() => RecurrenceCalendarState();
}

/// Represents the the state class of RecurrenceCalendarState
class RecurrenceCalendarState extends SampleViewState {
  /// Creates an instance of  state class of RecurrenceCalendarState
  RecurrenceCalendarState();

  /// Represents the calendar controller
  final CalendarController calendarController = CalendarController();
  late _AppointmentDataSource _dataSource;
  final List<Color> _colorCollection = <Color>[];
  final List<String> _colorNames = <String>[];
  final List<String> _timeZoneCollection = <String>[];

  final List<CalendarView> _allowedViews = <CalendarView>[
    CalendarView.day,
    CalendarView.workWeek,
  ];

  final TimeSlotViewSettings _timeSlotViewSettings = TimeSlotViewSettings(
    timeInterval: Duration(minutes: 30), timeFormat: 'h:mm',
    startHour: 7,
    endHour: 22,
  );

  /// Represents the controller
  final ScrollController controller = ScrollController();

  /// Global key used to maintain the state, when we change the parent of the
  /// widget
  final GlobalKey _globalKey = GlobalKey();
  late List<DateTime> _visibleDates;
  CalendarView _view = CalendarView.workWeek;

  Appointment? _selectedAppointment;
  bool _isAllDay = false;
  String _subject = '';
  int _selectedColorIndex = 0;

  @override
  void initState() {
    calendarController.view = _view;
    _dataSource = _AppointmentDataSource(_getRecursiveAppointments());
    super.initState();
  }

  void _onCalendarTapped(CalendarTapDetails calendarTapDetails) {
    /// Condition added to open the editor, when the calendar elements tapped
    /// other than the header.
    if (calendarTapDetails.targetElement == CalendarElement.header ||
        calendarTapDetails.targetElement == CalendarElement.viewHeader) {
      return;
    }

    _selectedAppointment = null;

    /// Navigates the calendar to day view,
    /// when we tap on month cells in mobile.
    if (!model.isWebFullView && calendarController.view == CalendarView.month) {
      calendarController.view = CalendarView.day;
    } else {
      if (calendarTapDetails.appointments != null &&
          calendarTapDetails.targetElement == CalendarElement.appointment) {
        final dynamic appointment = calendarTapDetails.appointments![0];
        if (appointment is Appointment) {
          _selectedAppointment = appointment;
        }
      }

      final DateTime selectedDate = calendarTapDetails.date!;
      final CalendarElement targetElement = calendarTapDetails.targetElement;

      /// To open the appointment editor for web,
      /// when the screen width is greater than 767.
      if (model.isWebFullView && !model.isMobileResolution) {
        final bool _isAppointmentTapped =
            calendarTapDetails.targetElement == CalendarElement.appointment;
        showDialog<Widget>(
            context: context,
            builder: (BuildContext context) {
              final List<Appointment> appointment = <Appointment>[];
              Appointment? newAppointment;

              /// Creates a new appointment, which is displayed on the tapped
              /// calendar element, when the editor is opened.
              if (_selectedAppointment == null) {
                _isAllDay = calendarTapDetails.targetElement ==
                    CalendarElement.allDayPanel;
                _selectedColorIndex = 0;
                _subject = '';
                final DateTime date = calendarTapDetails.date!;

                newAppointment = Appointment(
                  startTime: date,
                  endTime: date.add(const Duration(hours: 1)),
                  color: _colorCollection[_selectedColorIndex],
                  isAllDay: _isAllDay,
                  subject: _subject == '' ? '(No title)' : _subject,
                );
                appointment.add(newAppointment);

                _dataSource.appointments.add(appointment[0]);

                SchedulerBinding.instance
                    ?.addPostFrameCallback((Duration duration) {
                  _dataSource.notifyListeners(
                      CalendarDataSourceAction.add, appointment);
                });

                _selectedAppointment = newAppointment;
              }

              return WillPopScope(
                onWillPop: () async {
                  if (newAppointment != null) {
                    /// To remove the created appointment when the pop-up closed
                    /// without saving the appointment.
                    _dataSource.appointments.removeAt(
                        _dataSource.appointments.indexOf(newAppointment));
                    _dataSource.notifyListeners(CalendarDataSourceAction.remove,
                        <Appointment>[newAppointment]);
                  }
                  return true;
                },
                child: Center(
                    child: SizedBox(
                        width: _isAppointmentTapped ? 400 : 500,
                        height: _isAppointmentTapped
                            ? (_selectedAppointment!.location == null ||
                                    _selectedAppointment!.location!.isEmpty
                                ? 150
                                : 200)
                            : 400,
                        child: Theme(
                            data: ThemeData(
                              primarySwatch: Colors.red,
                            ),
                            child: Card(
                              margin: EdgeInsets.zero,
                              color: model.cardThemeColor,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                              child: _isAppointmentTapped
                                  ? displayAppointmentDetails(
                                      context,
                                      targetElement,
                                      selectedDate,
                                      model,
                                      _selectedAppointment!,
                                      _colorCollection,
                                      _colorNames,
                                      _dataSource,
                                      _timeZoneCollection,
                                      _visibleDates)
                                  : PopUpAppointmentEditor(
                                      model,
                                      newAppointment,
                                      appointment,
                                      _dataSource,
                                      _colorCollection,
                                      _colorNames,
                                      _selectedAppointment!,
                                      _timeZoneCollection,
                                      _visibleDates),
                            )))),
              );
            });
      } else {
        /// Navigates to the appointment editor page on mobile
        Navigator.push<Widget>(
          context,
          MaterialPageRoute<Widget>(
              builder: (BuildContext context) => AppointmentEditor(
                  model,
                  _selectedAppointment,
                  targetElement,
                  selectedDate,
                  _colorCollection,
                  _colorNames,
                  _dataSource,
                  _timeZoneCollection)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget _calendar = Theme(

        /// The key set here to maintain the state, when we change
        /// the parent of the widget
        key: _globalKey,
        data: ThemeData(
          primarySwatch: Colors.red,
        ).copyWith(
            colorScheme: ThemeData(
              primarySwatch: Colors.red,
            ).colorScheme
                .copyWith(secondary: model.backgroundColor)),
        child: _getRecurrenceCalendar(calendarController, _dataSource,
            _onViewChanged, scheduleViewBuilder, _onCalendarTapped));

    final double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Calendar'),
      ),
      drawer: NavDrawer(),
      body: Row(children: <Widget>[
        Expanded(
          child: calendarController.view == CalendarView.month &&
                  model.isWebFullView &&
                  _screenHeight < 800
              ? Scrollbar(
                  isAlwaysShown: true,
                  controller: controller,
                  child: ListView(
                    controller: controller,
                    children: <Widget>[
                      Container(
                        color: model.cardThemeColor,
                        height: 600,
                        child: _calendar,
                      )
                    ],
                  ))
              : Container(color: model.cardThemeColor, child: _calendar),
        )
      ]),
    );
  }

  /// The method called whenever the calendar view navigated to previous/next
  /// view or switched to different calendar view.
  void _onViewChanged(ViewChangedDetails visibleDatesChangedDetails) {
    _visibleDates = visibleDatesChangedDetails.visibleDates;
    if (_view == calendarController.view ||
        !model.isWebFullView ||
        (_view != CalendarView.month &&
            calendarController.view != CalendarView.month)) {
      return;
    }

    SchedulerBinding.instance?.addPostFrameCallback((Duration timeStamp) {
      setState(() {
        _view = calendarController.view!;

        /// Update the current view when the calendar view changed to
        /// month view or from month view.
      });
    });
  }

  /// Creates the data source with the recurrence appointments by adding required
  /// information on it.
  List<Appointment> _getRecursiveAppointments() {
    _colorNames.add('Green');
    _colorNames.add('Purple');
    _colorNames.add('Red');
    _colorNames.add('Orange');
    _colorNames.add('Caramel');
    _colorNames.add('Light Green');
    _colorNames.add('Blue');
    _colorNames.add('Peach');
    _colorNames.add('Gray');

    _timeZoneCollection.add('Default Time');
    _timeZoneCollection.add('AUS Central Standard Time');
    _timeZoneCollection.add('AUS Eastern Standard Time');
    _timeZoneCollection.add('Afghanistan Standard Time');
    _timeZoneCollection.add('Alaskan Standard Time');
    _timeZoneCollection.add('Arab Standard Time');
    _timeZoneCollection.add('Arabian Standard Time');
    _timeZoneCollection.add('Arabic Standard Time');
    _timeZoneCollection.add('Argentina Standard Time');
    _timeZoneCollection.add('Atlantic Standard Time');
    _timeZoneCollection.add('Azerbaijan Standard Time');
    _timeZoneCollection.add('Azores Standard Time');
    _timeZoneCollection.add('Bahia Standard Time');
    _timeZoneCollection.add('Bangladesh Standard Time');
    _timeZoneCollection.add('Belarus Standard Time');
    _timeZoneCollection.add('Canada Central Standard Time');
    _timeZoneCollection.add('Cape Verde Standard Time');
    _timeZoneCollection.add('Caucasus Standard Time');
    _timeZoneCollection.add('Cen. Australia Standard Time');
    _timeZoneCollection.add('Central America Standard Time');
    _timeZoneCollection.add('Central Asia Standard Time');
    _timeZoneCollection.add('Central Brazilian Standard Time');
    _timeZoneCollection.add('Central Europe Standard Time');
    _timeZoneCollection.add('Central European Standard Time');
    _timeZoneCollection.add('Central Pacific Standard Time');
    _timeZoneCollection.add('Central Standard Time');
    _timeZoneCollection.add('China Standard Time');
    _timeZoneCollection.add('Dateline Standard Time');
    _timeZoneCollection.add('E. Africa Standard Time');
    _timeZoneCollection.add('E. Australia Standard Time');
    _timeZoneCollection.add('E. South America Standard Time');
    _timeZoneCollection.add('Eastern Standard Time');
    _timeZoneCollection.add('Egypt Standard Time');
    _timeZoneCollection.add('Ekaterinburg Standard Time');
    _timeZoneCollection.add('FLE Standard Time');
    _timeZoneCollection.add('Fiji Standard Time');
    _timeZoneCollection.add('GMT Standard Time');
    _timeZoneCollection.add('GTB Standard Time');
    _timeZoneCollection.add('Georgian Standard Time');
    _timeZoneCollection.add('Greenland Standard Time');
    _timeZoneCollection.add('Greenwich Standard Time');
    _timeZoneCollection.add('Hawaiian Standard Time');
    _timeZoneCollection.add('India Standard Time');
    _timeZoneCollection.add('Iran Standard Time');
    _timeZoneCollection.add('Israel Standard Time');
    _timeZoneCollection.add('Jordan Standard Time');
    _timeZoneCollection.add('Kaliningrad Standard Time');
    _timeZoneCollection.add('Korea Standard Time');
    _timeZoneCollection.add('Libya Standard Time');
    _timeZoneCollection.add('Line Islands Standard Time');
    _timeZoneCollection.add('Magadan Standard Time');
    _timeZoneCollection.add('Mauritius Standard Time');
    _timeZoneCollection.add('Middle East Standard Time');
    _timeZoneCollection.add('Montevideo Standard Time');
    _timeZoneCollection.add('Morocco Standard Time');
    _timeZoneCollection.add('Mountain Standard Time');
    _timeZoneCollection.add('Mountain Standard Time (Mexico)');
    _timeZoneCollection.add('Myanmar Standard Time');
    _timeZoneCollection.add('N. Central Asia Standard Time');
    _timeZoneCollection.add('Namibia Standard Time');
    _timeZoneCollection.add('Nepal Standard Time');
    _timeZoneCollection.add('New Zealand Standard Time');
    _timeZoneCollection.add('Newfoundland Standard Time');
    _timeZoneCollection.add('North Asia East Standard Time');
    _timeZoneCollection.add('North Asia Standard Time');
    _timeZoneCollection.add('Pacific SA Standard Time');
    _timeZoneCollection.add('Pacific Standard Time');
    _timeZoneCollection.add('Pacific Standard Time (Mexico)');
    _timeZoneCollection.add('Pakistan Standard Time');
    _timeZoneCollection.add('Paraguay Standard Time');
    _timeZoneCollection.add('Romance Standard Time');
    _timeZoneCollection.add('Russia Time Zone 10');
    _timeZoneCollection.add('Russia Time Zone 11');
    _timeZoneCollection.add('Russia Time Zone 3');
    _timeZoneCollection.add('Russian Standard Time');
    _timeZoneCollection.add('SA Eastern Standard Time');
    _timeZoneCollection.add('SA Pacific Standard Time');
    _timeZoneCollection.add('SA Western Standard Time');
    _timeZoneCollection.add('SE Asia Standard Time');
    _timeZoneCollection.add('Samoa Standard Time');
    _timeZoneCollection.add('Singapore Standard Time');
    _timeZoneCollection.add('South Africa Standard Time');
    _timeZoneCollection.add('Sri Lanka Standard Time');
    _timeZoneCollection.add('Syria Standard Time');
    _timeZoneCollection.add('Taipei Standard Time');
    _timeZoneCollection.add('Tasmania Standard Time');
    _timeZoneCollection.add('Tokyo Standard Time');
    _timeZoneCollection.add('Tonga Standard Time');
    _timeZoneCollection.add('Turkey Standard Time');
    _timeZoneCollection.add('US Eastern Standard Time');
    _timeZoneCollection.add('US Mountain Standard Time');
    _timeZoneCollection.add('UTC');
    _timeZoneCollection.add('UTC+12');
    _timeZoneCollection.add('UTC-02');
    _timeZoneCollection.add('UTC-11');
    _timeZoneCollection.add('Ulaanbaatar Standard Time');
    _timeZoneCollection.add('Venezuela Standard Time');
    _timeZoneCollection.add('Vladivostok Standard Time');
    _timeZoneCollection.add('W. Australia Standard Time');
    _timeZoneCollection.add('W. Central Africa Standard Time');
    _timeZoneCollection.add('W. Europe Standard Time');
    _timeZoneCollection.add('West Asia Standard Time');
    _timeZoneCollection.add('West Pacific Standard Time');
    _timeZoneCollection.add('Yakutsk Standard Time');

    _colorCollection.add(const Color(0xFF0F8644));
    _colorCollection.add(const Color(0xFF8B1FA9));
    _colorCollection.add(const Color(0xFFD20100));
    _colorCollection.add(const Color(0xFFFC571D));
    _colorCollection.add(const Color(0xFF36B37B));
    _colorCollection.add(const Color(0xFF01A1EF));
    _colorCollection.add(const Color(0xFF3D4FB5));
    _colorCollection.add(const Color(0xFFE47C73));
    _colorCollection.add(const Color(0xFF636363));

    final List<Appointment> appointments = <Appointment>[];
    final Random random = Random();

    //Recurrence Appointment 1
    final DateTime semester2start = globals.semesterTwoStart;
    final DateTime end = globals.semesterTwoStart;

    final DateTime b1StartTime =
        DateTime(semester2start.year, semester2start.month, semester2start.day, 7, 20, 0);
    final DateTime b1EndTime = DateTime(
        semester2start.year, semester2start.month, semester2start.day, 8, 38, 0);
    final RecurrenceProperties b1Recurrence =
        RecurrenceProperties(
            startDate: b1StartTime,
            recurrenceType: RecurrenceType.daily,
            recurrenceRange: RecurrenceRange.count,
            recurrenceCount: 90);

    final Appointment blockOne = Appointment(
        startTime: b1StartTime,
        endTime: b1EndTime,
        color: _colorCollection[0],
        subject: 'Block One',
        recurrenceRule: SfCalendar.generateRRule(
            b1Recurrence, b1StartTime, b1EndTime));

    appointments.add(blockOne);

    final DateTime b2StartTime =
    DateTime(semester2start.year, semester2start.month, semester2start.day, 8, 53, 0);
    final DateTime b2EndTime = DateTime(
        semester2start.year, semester2start.month, semester2start.day, 10, 11, 0);
    final RecurrenceProperties b2Recurrence =
    RecurrenceProperties(
        startDate: b2StartTime,
        recurrenceType: RecurrenceType.daily,
        recurrenceRange: RecurrenceRange.count,
        recurrenceCount: 90);

    final Appointment blockTwo = Appointment(
        startTime: b2StartTime,
        endTime: b2EndTime,
        color: _colorCollection[1],
        subject: 'Block Two',
        recurrenceRule: SfCalendar.generateRRule(
            b2Recurrence, b2StartTime, b2EndTime));

    appointments.add(blockTwo);

    final DateTime b3StartTime =
    DateTime(semester2start.year, semester2start.month, semester2start.day, 10, 16, 0);
    final DateTime b3EndTime = DateTime(
        semester2start.year, semester2start.month, semester2start.day, 11, 34, 0);
    final RecurrenceProperties b3Recurrence =
    RecurrenceProperties(
        startDate: b3StartTime,
        recurrenceType: RecurrenceType.daily,
        recurrenceRange: RecurrenceRange.count,
        recurrenceCount: 90);

    final Appointment blockThree = Appointment(
        startTime: b3StartTime,
        endTime: b3EndTime,
        color: _colorCollection[2],
        subject: 'Block Two',
        recurrenceRule: SfCalendar.generateRRule(
            b3Recurrence, b3StartTime, b3EndTime));

    appointments.add(blockThree);

    final DateTime b4StartTime =
    DateTime(semester2start.year, semester2start.month, semester2start.day, 11, 39, 0);
    final DateTime b4EndTime = DateTime(
        semester2start.year, semester2start.month, semester2start.day, 12, 57, 0);
    final RecurrenceProperties b4Recurrence =
    RecurrenceProperties(
        startDate: b4StartTime,
        recurrenceType: RecurrenceType.daily,
        recurrenceRange: RecurrenceRange.count,
        recurrenceCount: 90);

    final Appointment blockFour = Appointment(
        startTime: b4StartTime,
        endTime: b4EndTime,
        color: _colorCollection[3],
        subject: 'Block Two',
        recurrenceRule: SfCalendar.generateRRule(
            b4Recurrence, b4StartTime, b4EndTime));

    appointments.add(blockFour);

    final DateTime b5StartTime =
    DateTime(semester2start.year, semester2start.month, semester2start.day, 13, 02, 0);
    final DateTime b5EndTime = DateTime(
        semester2start.year, semester2start.month, semester2start.day, 14, 20, 0);
    final RecurrenceProperties b5Recurrence =
    RecurrenceProperties(
        startDate: b5StartTime,
        recurrenceType: RecurrenceType.daily,
        recurrenceRange: RecurrenceRange.count,
        recurrenceCount: 90);

    final Appointment blockFive = Appointment(
        startTime: b5StartTime,
        endTime: b5EndTime,
        color: _colorCollection[4],
        subject: 'Block Two',
        recurrenceRule: SfCalendar.generateRRule(
            b5Recurrence, b5StartTime, b5EndTime));

    appointments.add(blockFive);

    return appointments;
  }

  /// Returns the calendar widget based on the properties passed
  SfCalendar _getRecurrenceCalendar(
      [CalendarController? calendarController,
      CalendarDataSource? calendarDataSource,
      dynamic onViewChanged,
      dynamic scheduleViewBuilder,
      dynamic calendarTapCallback]) {
    return SfCalendar(
      showNavigationArrow: model.isWebFullView,
      controller: calendarController,
      allowedViews: _allowedViews,
      timeSlotViewSettings: _timeSlotViewSettings,
      scheduleViewMonthHeaderBuilder: scheduleViewBuilder,
      showDatePickerButton: true,
      onViewChanged: onViewChanged,
      dataSource: calendarDataSource,
      monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          appointmentDisplayCount: 4),
      onTap: calendarTapCallback,
    );
  }
}

/// An object to set the appointment collection data source to collection, and
/// allows to add, remove or reset the appointment collection.
class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(this.source);

  List<Appointment> source;

  @override
  List<dynamic> get appointments => source;
}
