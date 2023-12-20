import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  Map selectedDate = {};
  List genratedMonthsHeading;
  String themeMode = '';
  dynamic pageController;

  CalendarStateDispatcher({
    required this.eventData,
    required this.currentEventIndex,
    required this.action,
    required this.themeMode,
    required this.selectedDate,
    required this.genratedMonthsHeading,
    required this.pageController,
  });

  factory CalendarStateDispatcher.initial() => CalendarStateDispatcher(
        eventData: [],
        currentEventIndex: 0,
        action: '',
        selectedDate: {},
        themeMode: '',
        genratedMonthsHeading: [],
        pageController: null,
      );
}

// update calendar index as per event data
Function updateCalendarIndex =
    (Store<AppState> store, int currentEventIndex) async {
  List monthsGenerate = [];
  List monthsHeading = [];
  if ((store.state.calendarState.calendar.eventData.length -
          store.state.calendarState.calendar.currentEventIndex) ==
      3) {
    // Todo: GENRATE 6 MONTH AHED
    Map now = store.state.calendarState.calendar.genratedMonthsHeading[
        store.state.calendarState.calendar.genratedMonthsHeading.length - 1];
    for (int i = 1; i < 7; i++) {
      int month = now['month'] + i;
      int year = now['year'];

      if (month > 12) {
        month -= 12;
        year++;
      }

      monthsGenerate.add({'month': month, 'year': year});
      monthsHeading.add(DateFunctions().getMonthsHeading(year, month));
    }
    List monthsDate = [];
    for (Map element in monthsGenerate) {
      monthsDate.add(
        DateFunctions().monthArrayWidget(element['year'], element['month']),
      );
    }
    store.dispatch(
      CalendarStateDispatcher(
        eventData: monthsDate,
        currentEventIndex: currentEventIndex,
        pageController: null,
        selectedDate: {},
        themeMode: '',
        action: 'AHEAD_MONTHS_GENENRATE',
        genratedMonthsHeading: monthsHeading,
      ),
    );
  } else if (currentEventIndex == 3) {
    //TODO: GENRATE 6 MONTH BEFORE
    Map now = store.state.calendarState.calendar.genratedMonthsHeading[0];
    for (int i = 1; i < 7; i++) {
      int month = now['month'] - i;
      int year = now['year'];

      if (month < 1) {
        month += 12;
        year--;
      }

      monthsGenerate.add({'month': month, 'year': year});
      monthsHeading.add(DateFunctions().getMonthsHeading(year, month));
    }
    List monthsDate = [];
    for (Map element in monthsGenerate) {
      monthsDate.add(
        DateFunctions().monthArrayWidget(element['year'], element['month']),
      );
    }
    store.dispatch(
      CalendarStateDispatcher(
        eventData: monthsDate.reversed.toList(),
        currentEventIndex: currentEventIndex + monthsHeading.length,
        action: 'BEFORE_MONTHS_GENENRATE',
        pageController: null,
        selectedDate: {},
        themeMode: '',
        genratedMonthsHeading: monthsHeading.reversed.toList(),
      ),
    );
  } else {
    store.dispatch(
      CalendarStateDispatcher(
        eventData: [],
        currentEventIndex: currentEventIndex + monthsHeading.length,
        action: 'UPDATE_EVENT_INDEX',
        pageController: null,
        selectedDate: {},
        themeMode: '',
        genratedMonthsHeading: [],
      ),
    );
  }
};

//Update Date
Function selectDate = (Store<AppState> store, int date) async {
  Map currentState = store.state.calendarState.calendar.genratedMonthsHeading[
      store.state.calendarState.calendar.currentEventIndex];
  store.dispatch(
    CalendarStateDispatcher(
      eventData: [],
      currentEventIndex: 0,
      action: 'SELECT_DATE',
      pageController: null,
      themeMode: '',
      selectedDate: {
        'date': date,
        'month': currentState['month'],
        'year': currentState['year']
      },
      genratedMonthsHeading: [],
    ),
  );
};

//Update ThemeMode
Function updateThemeMode = (Store<AppState> store, String mode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('themeMode', mode);

  store.dispatch(
    CalendarStateDispatcher(
      eventData: [],
      currentEventIndex: 0,
      action: 'UPDATE_THEME',
      pageController: null,
      themeMode: mode,
      selectedDate: {},
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
  List<Map> monthsHeading = [];

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
      DateFunctions().monthArrayWidget(element['year'], element['month']),
    );
  }

  store.dispatch(
    CalendarStateDispatcher(
      eventData: monthsDate,
      currentEventIndex: 6, // currentMonth index
      action: 'INITIAL_MONTHS',
      genratedMonthsHeading: monthsHeading,
      selectedDate: {},
      themeMode: '',
      pageController: null,
    ),
  );
};

Function setPageController =
    (Store<AppState> store, PageController controller) async {
  store.dispatch(
    CalendarStateDispatcher(
      eventData: [],
      currentEventIndex: 6, // currentMonth index
      action: 'SET_PAGE_CONTROLLER',
      selectedDate: {},
      themeMode: '',
      genratedMonthsHeading: [],
      pageController: controller,
    ),
  );
};
