import 'package:redux/redux.dart';
import 'package:vaishnanva_calendar/utils/date_functions.dart';

import 'main_action.dart';

//State Management
class CalendarState {
  CalendarStateDispatcher calendar;

  CalendarState({required this.calendar});

  factory CalendarState.initial() => CalendarState(
        calendar: CalendarStateDispatcher.initial(),
      );
}

//State Dispatcher
class CalendarStateDispatcher {
  List eventData = [];
  int currentEventIndex = 0;
  String action = '';
  List genratedMonthsHeading;

  CalendarStateDispatcher({
    required this.eventData,
    required this.currentEventIndex,
    required this.action,
    required this.genratedMonthsHeading,
  });

  factory CalendarStateDispatcher.initial() => CalendarStateDispatcher(
        eventData: [],
        currentEventIndex: 0,
        action: '',
        genratedMonthsHeading: [],
      );
}

// update calendar index as per event data
Function updateCalendarIndex =
    (Store<AppState> store, int currentEventIndex) async {
  if ((store.state.calendarState.calendar.eventData.length -
          store.state.calendarState.calendar.currentEventIndex) <
      3) {
    // Todo: GENRATE 6 MONTH AHED
    print("GENRATE 6 MONTH AHED");
  }
  if (currentEventIndex < 3) {
    //TODO: GENRATE 6 MONTH BEFORE
    print("GENRATE 6 MONTH BEFORE");
  }

  store.dispatch(
    CalendarStateDispatcher(
      eventData: [],
      currentEventIndex: currentEventIndex,
      action: 'UPDATE_EVENT_INDEX',
      genratedMonthsHeading: [],
    ),
  );
};

Function genrateCalendar = (Store<AppState> store) async {
  List monthsDate = [];
  DateTime now = DateTime.now();

  int currentMonth = now.month;
  int currentYear = now.year;
  List<Map> monthsGenerate = [];
  List<String> monthsHeading = [];

  // 6 month before
  for (int i = 1; i < 7; i++) {
    int month = currentMonth - i;
    int year = currentYear;

    if (month < 1) {
      month += 12;
      year--;
    }

    monthsGenerate.add({'month': month, 'year': year});
    monthsHeading.add(DateFunctions().getMonthsHeading(year, month));
  }
  monthsGenerate = monthsGenerate.reversed.toList();
  monthsHeading = monthsHeading.reversed.toList();
  // 6 month ahead
  for (int i = 0; i < 7; i++) {
    int month = currentMonth + i;
    int year = currentYear;
    if (month > 12) {
      month -= 12;
      year++;
    }
    monthsGenerate.add({'month': month, 'year': year});
    monthsHeading.add(DateFunctions().getMonthsHeading(year, month));
  }

  for (Map element in monthsGenerate) {
    monthsDate.add(
        DateFunctions().monthArrayWidget(element['year'], element['month']));
  }


  store.dispatch(
    CalendarStateDispatcher(
      eventData: monthsDate,
      currentEventIndex: 6, // currentMonth index
      action: 'INITIAL_MONTHS',
      genratedMonthsHeading: monthsHeading,
    ),
  );
};
