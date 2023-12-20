import 'package:devotional_calendar/redux/reducer/calendar_reducer.dart';

import '../action/main_action.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    calendarState: calendarStateReducer(state.calendarState, action),
  );
}
