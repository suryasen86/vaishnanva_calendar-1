import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaishnanva_calendar/common/colors.dart';
import 'package:vaishnanva_calendar/utils/status_bar_utils.dart';
import 'package:vaishnanva_calendar/widget/default_text.dart';
import 'package:vaishnanva_calendar/widget/event_calendar.dart';

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
        converter: (store) => store.state,
        onInit: (store) => {StatusBarUtil.instance.lightThemeStatusBar()},
        builder: (_, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.appBarColor,
              elevation: 0,
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.today),
                    SizedBox(width: 16),
                    Icon(Icons.search),
                    SizedBox(width: 16),
                    Icon(Icons.settings),
                    SizedBox(width: 16),
                  ],
                ),
              ],
              title: Text(
                "27 October 2023",
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
            body: Column(
              children: [],
            ),
          );
        });
  }
}
