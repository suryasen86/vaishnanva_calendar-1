import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaishnanva_calendar/common/colors.dart';
import 'package:vaishnanva_calendar/ui/settings.dart';
import 'package:vaishnanva_calendar/utils/status_bar_utils.dart';
import 'package:vaishnanva_calendar/widget/event_calendar.dart';

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
        onInit: (store) => {StatusBarUtil.instance.lightThemeStatusBar()},
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
              backgroundColor: AppColors.appBarColor,
              elevation: 0,
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.today),
                    SizedBox(width: 16),
                    Icon(Icons.search),
                    SizedBox(width: 16),
                    InkWell(
                      onTap: () {
                        Get.to(() => const Settings());
                      },
                      child: Icon(Icons.settings),
                    ),
                    SizedBox(width: 16),
                  ],
                ),
              ],
              title: Text(
                heading,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    letterSpacing: 0,
                  ),
                ),
              ),
              centerTitle: false,
            ),
            body: const EventCalendar(),
          );
        });
  }
}
