import 'package:devotional_calendar/redux/action/calendar_state.dart';

class AppState {
  final CalendarState calendarState;
  AppState({required this.calendarState});

  factory AppState.initialState() => AppState(
        calendarState: CalendarState.initial(),
      );
}
