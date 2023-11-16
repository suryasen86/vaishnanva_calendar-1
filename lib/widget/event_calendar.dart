import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vaishnanva_calendar/redux/action/calendar_state.dart';
import 'package:vaishnanva_calendar/redux/store.dart';

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
        onInit: (store) => {store.dispatch(genrateCalendar)},
        builder: (_, state) {
          // TODO: get page controller from store
          List eventCalendar = store.state.calendarState.calendar.eventData;
          return Container(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 32),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    weeksDays.length,
                    (index) => Text(
                      weeksDays[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFF808080),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  alignment: Alignment.center,
                  child: PageView.builder(
                    itemCount: eventCalendar.length,
                    controller: _pageController,
                    onPageChanged: (value) {
                      updateCalendarIndex(store, value);
                    },
                    itemBuilder: (context, index) {
                      return Container(
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
                                  (rowIndex) => Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    width: (MediaQuery.of(context).size.width -
                                            16) /
                                        7,
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      eventCalendar[index][colIndex][rowIndex],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Color(0xAA000000),
                                        fontWeight: FontWeight.w400,
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
