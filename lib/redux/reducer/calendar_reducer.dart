import 'package:vaishnanva_calendar/redux/action/calendar_state.dart';

CalendarState calendarStateReducer(CalendarState state, dynamic action) {
  CalendarState newState = state;

  if (action is CalendarStateDispatcher) {
    if (action.action == 'UPDATE_EVENT_INDEX') {
      newState.calendar.currentEventIndex = action.currentEventIndex;
    } else if (action.action == 'INITIAL_MONTHS') {
      newState.calendar.eventData = action.eventData;
      newState.calendar.currentEventIndex = action.currentEventIndex;
      newState.calendar.genratedMonthsHeading = action.genratedMonthsHeading;
    }
    return newState;
  } else {
    return state;
  }
}
