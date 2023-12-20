import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaishnanva_calendar/common/colors.dart';
import 'package:vaishnanva_calendar/ui/components/date-details.dart';
import 'package:vaishnanva_calendar/ui/settings.dart';
import 'package:vaishnanva_calendar/utils/status_bar_utils.dart';
import 'package:vaishnanva_calendar/widget/default_text.dart';
import 'package:vaishnanva_calendar/widget/event_calendar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        converter: (store) => store,
        onInit: (store) => {},
        builder: (_, store) {
          String heading =
              store.state.calendarState.calendar.genratedMonthsHeading.length ==
                      0
                  ? ''
                  : store.state.calendarState.calendar.genratedMonthsHeading[
                          store.state.calendarState.calendar.currentEventIndex]
                      ['heading'];
          return Scaffold(
            appBar: AppBar(
              backgroundColor:
                  store.state.calendarState.calendar.themeMode == 'LIGHT'
                      ? AppColors.lightMode.appBarColor
                      : AppColors.darkMode.appBarColor,
              elevation: 0,
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.today,
                    ),
                    const SizedBox(width: 16),
                    const Icon(Icons.search),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () {
                        Get.to(() => const Settings());
                      },
                      child: const Icon(Icons.settings),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ],
              title: Text(
                heading,
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    letterSpacing: -0.24,
                  ),
                ),
              ),
              centerTitle: false,
            ),
            body: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EventCalendar(),
                  Divider(
                    color:
                        store.state.calendarState.calendar.themeMode == 'LIGHT'
                            ? Color(0xFFFFF4BB)
                            : Color(0xFF3F4F59),
                    thickness: 1.0,
                  ),
                  ...store.state.calendarState.calendar.selectedDate['date'] !=
                          null
                      ? [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 17),
                            margin: const EdgeInsets.only(top: 24),
                            child: Text(
                              'Break the fast from 6:00 AM to 10:30 AM',
                              style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                  color: Color(0xFFFF542F),
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                  letterSpacing: -0.24,
                                ),
                              ),
                            ),
                          ),

                          // Date Details
                          Container(
                            margin: const EdgeInsets.only(top: 22),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                dateDetails("Gaurabda", "574"),
                                dateDetails("Masa", "Damodara"),
                                dateDetails("Tithi", "Dvadasi"),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 16, right: 16, top: 32),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      (MediaQuery.of(context).size.width - 42) /
                                          2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/sun.svg',
                                        width: 22,
                                        height: 22,
                                      ),
                                      const SizedBox(
                                        height: 18,
                                      ),
                                      muhurtaDetails(
                                          'Brahma muhurta:', '5:14 AM'),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      muhurtaDetails('Sunrise:', '5:14 AM'),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      muhurtaDetails('Noon', '5:14 AM'),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      muhurtaDetails('Sunset', '5:14 AM'),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width:
                                      (MediaQuery.of(context).size.width - 42) /
                                          2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/moon.svg',
                                        width: 22,
                                        height: 22,
                                      ),
                                      const SizedBox(
                                        height: 18,
                                      ),
                                      muhurtaDetails('Paksa:', '5:14 AM'),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      muhurtaDetails('Moonrise:', '5:14 AM'),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      muhurtaDetails('Moonset:', '5:14 AM'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]
                      : [
                          Container(
                            margin: const EdgeInsets.only(top: 40),
                            child: const DefaultText(),
                          ),
                        ]
                ],
              ),
            ),
          );
        });
  }
}
