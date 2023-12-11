import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:daily/core/build_configs/build_config_manager.dart';
import 'package:daily/core/consts/keys.dart';
import 'package:daily/core/shared_preferences/shared_preferences.dart';

logPrint(String text) {
  if (kDebugMode) {
    log(text, name: config.appTitle, time: DateTime.now());
  }
}

class Logger {
  List<String> logs = [];
  List<String> getLogs() {
    logs = prefs.getStringList(KeysNames.logKey) ?? [];
    return logs;
  }

  Future<bool> setLog(String log) async {
    getLogs();
    logs.insert(0, log);
    try {
      bool result = await prefs.setStringList(KeysNames.logKey, logs);
      return result;
    } catch (e) {
      return false;
    }
  }

  clearLogs() {
    prefs.remove(KeysNames.logKey);
  }
}
