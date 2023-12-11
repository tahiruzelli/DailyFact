import 'package:daily/core/build_configs/build_config_manager.dart';
import 'package:daily/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../logger/logger.dart';

late Size size;

late Logger logger;

class DailyApp extends StatelessWidget {
  const DailyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // LocalJsonLocalization.delegate.directories = ['i18n'];
    logPrint(config.appTitle);
    return MaterialApp(
      title: config.appTitle,
      theme: ThemeData(
        fontFamily: 'DMSans',
        primaryColor: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: (config is DeviceGestureSettings),
      routes: {
        HomeScreen.route: (context) => const HomeScreen(),
      },
      initialRoute: HomeScreen.route,
    );
  }
}
