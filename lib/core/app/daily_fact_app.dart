import 'package:daily/core/build_configs/build_config_manager.dart';
import 'package:daily/features/home/presentation/pages/home_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../logger/logger.dart';

late Logger logger;

class DailyApp extends StatelessWidget {
  const DailyApp({super.key});

  @override
  Widget build(BuildContext context) {
    logPrint(config.appTitle);
    return MaterialApp(
      title: config.appTitle,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        fontFamily: 'DMSans',
        primaryColor: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: (config is DeviceGestureSettings),
      routes: {
        HomeScreen.route: (context) => HomeScreen(),
      },
      initialRoute: HomeScreen.route,
    );
  }
}
