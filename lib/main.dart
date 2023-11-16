import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:vaishnanva_calendar/common/colors.dart';
import 'package:vaishnanva_calendar/redux/store.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get.dart';
import 'package:vaishnanva_calendar/ui/home.dart';

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
          onInit: (store) async {},
          onDispose: (store) => {},
          onInitialBuild: (viewModel) {},
          builder: (_, store) {
            return GetMaterialApp(
              theme: ThemeData(
                primaryColor: AppColors.primaryColor,
                  scaffoldBackgroundColor: AppColors.backgroundColor,

              ),
              debugShowCheckedModeBanner: false,
              home: const Home(),
            );
          }),
    );
  }
}
