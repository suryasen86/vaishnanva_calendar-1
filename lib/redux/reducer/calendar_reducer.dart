import 'package:vaishnanva_calendar/redux/action/calendar_state.dart';

CalendarState calendarStateReducer(CalendarState state, dynamic action) {
  CalendarState newState = state;

  if (action is CalendarStateDispatcher) {
    if (action.action == 'UPDATE_EVENT_INDEX') {
      newState.calendar.currentEventIndex = action.currentEventIndex;
    } else if (action.action == 'SET_PAGE_CONTROLLER') {
      newState.calendar.pageController = action.pageController;
    } else if (action.action == 'INITIAL_MONTHS') {
      newState.calendar.eventData = action.eventData;
      newState.calendar.currentEventIndex = action.currentEventIndex;
      newState.calendar.genratedMonthsHeading = action.genratedMonthsHeading;
    } else if (action.action == 'AHEAD_MONTHS_GENENRATE') {
      newState.calendar.eventData = [
        ...state.calendar.eventData,
        ...action.eventData
      ];
      newState.calendar.genratedMonthsHeading = [
        ...state.calendar.genratedMonthsHeading,
        ...action.genratedMonthsHeading
      ];
    } else if (action.action == 'BEFORE_MONTHS_GENENRATE') {
      newState.calendar.eventData = [
        ...action.eventData,
        ...state.calendar.eventData
      ];
      newState.calendar.genratedMonthsHeading = [
        ...action.genratedMonthsHeading,
        ...state.calendar.genratedMonthsHeading
      ];
      newState.calendar.currentEventIndex = action.currentEventIndex;
      state.calendar.pageController?.jumpToPage(action.currentEventIndex);
    }
    return newState;
  } else {
    return state;
  }
}
