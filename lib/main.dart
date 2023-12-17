import 'package:daily/core/app/daily_fact_app.dart';
import 'package:daily/core/consts/keys/keys.dart';
import 'package:daily/core/localization/project_localization.dart';
import 'package:daily/core/locator/service_locator.dart';
import 'package:daily/core/shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

late FirebaseFirestore firestore;

late int factIndex;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final app = await Firebase.initializeApp();
  firestore = FirebaseFirestore.instanceFor(app: app);

  prefs = await SharedPreferences.getInstance();

  String? startDateStr = prefs.getString(KeysNames.startDateKey);
  if (startDateStr == null) {
    //first time at app
    prefs.setString(KeysNames.startDateKey, DateTime.now().toString());
    factIndex = 0;
    prefs.setInt(KeysNames.factIndexKey, factIndex);
  } else {
    DateTime startDate = DateTime.parse(startDateStr);
    int differenceInDays = DateTime.now().difference(startDate).inDays;
    factIndex = differenceInDays;
    if (factIndex < 0) {
      factIndex = 0;
    } else if (factIndex > 100) {
      factIndex = 0;
    }
  }

  configureDependencies();
  runApp(
    ProjectLocalization(
      child: const DailyApp(),
    ),
  );
}
