import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:devotional_calendar/common/colors.dart';
import 'package:devotional_calendar/redux/action/calendar_state.dart';
import 'package:devotional_calendar/redux/store.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get.dart';
import 'package:devotional_calendar/ui/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:devotional_calendar/utils/status_bar_utils.dart';

void main() {
  runApp(MainApp(
    store: store,
  ));
}

class MainApp extends StatelessWidget {
  final Store<dynamic> store;

  const MainApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<dynamic>(
      store: store,
      child: StoreConnector<dynamic, dynamic>(
          converter: (store) => store,
          onInit: (store) async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            store.dispatch(
              updateThemeMode(store, prefs.getString('themeMode') ?? "LIGHT"),
            );
            (prefs.getString('themeMode') ?? "LIGHT") == 'LIGHT'
                ? StatusBarUtil.instance.lightThemeStatusBar()
                : StatusBarUtil.instance.darkThemeStatusBar();
          },
          onDispose: (store) => {},
          onInitialBuild: (viewModel) {},
          builder: (_, store) {
            return GetMaterialApp(
              theme: ThemeData(
                primaryColor: AppColors.lightMode.primaryColor,
                scaffoldBackgroundColor:
                    store.state.calendarState.calendar.themeMode == 'LIGHT'
                        ? AppColors.lightMode.backgroundColor
                        : AppColors.darkMode.backgroundColor,
              ),
              debugShowCheckedModeBanner: false,
              home: const Home(),
            );
          }),
    );
  }
}
