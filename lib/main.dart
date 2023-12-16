import 'package:daily/core/app/daily_fact_app.dart';
import 'package:daily/core/localization/project_localization.dart';
import 'package:daily/core/locator/service_locator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

late FirebaseFirestore firestore;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final app = await Firebase.initializeApp();
  firestore = FirebaseFirestore.instanceFor(app: app);
  configureDependencies();
  runApp(
    ProjectLocalization(
      child: const DailyApp(),
    ),
  );
}
