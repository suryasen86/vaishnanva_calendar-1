import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:devotional_calendar/redux/action/calendar_state.dart';
import 'package:devotional_calendar/redux/store.dart';

class EventCalendar extends StatefulWidget {
  const EventCalendar({super.key});

  @override
  State<EventCalendar> createState() => _EventCalendarState();
}

class _EventCalendarState extends State<EventCalendar> {
  // TODO: change initial value as per current Date
  final PageController _pageController = PageController(initialPage: 6);
  List weeksDays = [
    "SU",
    "MO",
    "TU",
    "WE",
    "TH",
    "FR",
    "SA",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<dynamic, dynamic>(
        converter: (store) => store.state,
        onInit: (store) {
          store.dispatch(genrateCalendar);
          store.dispatch(setPageController(store, _pageController));
        },
        builder: (_, state) {
          List eventCalendar = store.state.calendarState.calendar.eventData;
          Map currentHeadingState =
              store.state.calendarState.calendar.genratedMonthsHeading[
                  store.state.calendarState.calendar.currentEventIndex];
          Map selectedDate = store.state.calendarState.calendar.selectedDate;

          return Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 32),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    weeksDays.length,
                    (index) => Text(
                      weeksDays[index],
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          letterSpacing: -0.2,
                          color: store.state.calendarState.calendar.themeMode ==
                                  'LIGHT'
                              ? Color(0xFF95928B)
                              : Color(0xFF969696),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  alignment: Alignment.center,
                  child: PageView.builder(
                    itemCount: eventCalendar.length,
                    controller: _pageController,
                    onPageChanged: (value) {
                      updateCalendarIndex(store, value);
                    },
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        child: Column(
                          children: List.generate(
                            eventCalendar[index].length,
                            (colIndex) => Container(
                              margin:
                                  EdgeInsets.only(top: colIndex == 0 ? 8 : 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: List.generate(
                                  eventCalendar[index][colIndex].length,
                                  (rowIndex) => InkWell(
                                    onTap: () {
                                      store.dispatch(
                                        selectDate(
                                          store,
                                          int.parse(eventCalendar[index]
                                              [colIndex][rowIndex]),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: selectedDate['date']
                                                          .toString() ==
                                                      eventCalendar[index]
                                                              [colIndex]
                                                          [rowIndex] &&
                                                  currentHeadingState['year'] ==
                                                      selectedDate['year'] &&
                                                  selectedDate['month'] ==
                                                      currentHeadingState[
                                                          'month']
                                              ? store.state.calendarState
                                                          .calendar.themeMode ==
                                                      'LIGHT'
                                                  ? Colors.black
                                                  : const Color(0xFFE0EDF6)
                                              : Colors.transparent,
                                        ),
                                      ),
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  40) /
                                              7,
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        eventCalendar[index][colIndex]
                                            [rowIndex],
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              fontSize: 16,
                                              color: store.state.calendarState
                                                          .calendar.themeMode ==
                                                      'LIGHT'
                                                  ? Color(0xFF333333)
                                                  : Color(0xFFE0EDF6),
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: -.24),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
