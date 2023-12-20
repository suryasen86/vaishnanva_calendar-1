import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:devotional_calendar/common/colors.dart';
import 'package:devotional_calendar/redux/action/calendar_state.dart';
import 'package:devotional_calendar/utils/status_bar_utils.dart';
import 'package:devotional_calendar/widget/default_text.dart';
import 'package:devotional_calendar/widget/event_calendar.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
          return Scaffold(
            appBar: AppBar(
              backgroundColor:
                  store.state.calendarState.calendar.themeMode == 'LIGHT'
                      ? AppColors.lightMode.appBarColor
                      : AppColors.darkMode.appBarColor,
              elevation: 0,
              title: Text(
                "Settings",
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
              margin: const EdgeInsets.only(left: 16, right: 16, top: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Appearance",
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: Color(0xff02A0E7),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        letterSpacing: -0.24,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            padding: const EdgeInsets.only(top: 20, bottom: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: store.state.calendarState.calendar
                                          .themeMode ==
                                      'LIGHT'
                                  ? Colors.white
                                  : Color(0xff969696),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading: const Icon(Icons.lightbulb_outline),
                                  trailing: Icon(
                                    Icons.check,
                                    color: store.state.calendarState.calendar
                                                .themeMode ==
                                            'LIGHT'
                                        ? Colors.green
                                        : Colors.transparent,
                                  ),
                                  title: Text(
                                    "Light Mode",
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Color(0xFF333333),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        letterSpacing: -0.24,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    store.dispatch(
                                      updateThemeMode(store, "LIGHT"),
                                    );
                                    StatusBarUtil.instance
                                        .lightThemeStatusBar();
                                    Navigator.pop(context);
                                  },
                                ),
                                const Divider(
                                  thickness: 1,
                                  color: Color(0xFFFFF4BB),
                                ),
                                ListTile(
                                  leading: const Icon(Icons.brightness_3),
                                  trailing: Icon(
                                    Icons.check,
                                    color: store.state.calendarState.calendar
                                                .themeMode ==
                                            'DARK'
                                        ? Colors.green
                                        : Colors.transparent,
                                  ),
                                  title: Text(
                                    "Dark Mode",
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        color: Color(0xFF333333),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        letterSpacing: -0.24,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    store.dispatch(
                                      updateThemeMode(store, "DARK"),
                                    );
                                    StatusBarUtil.instance.darkThemeStatusBar();
                                    Navigator.pop(context);
                                  },
                                ),
                                const Divider(
                                  thickness: 1,
                                  color: Color(0xFFFFF4BB),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dark Mode",
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                color: store.state.calendarState.calendar
                                            .themeMode ==
                                        'LIGHT'
                                    ? Color(0xFF333333)
                                    : Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                letterSpacing: -0.24,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Dark Mode",
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                color: Color(0xFF95928B),
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                letterSpacing: -0.24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
