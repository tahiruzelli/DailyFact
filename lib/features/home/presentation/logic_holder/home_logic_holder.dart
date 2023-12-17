import 'dart:math';

import 'package:daily/core/consts/data/fact_arrays.dart';
import 'package:daily/core/consts/keys/keys.dart';
import 'package:daily/core/shared_preferences/shared_preferences.dart';
import 'package:daily/main.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
part 'home_logic_holder.g.dart';

@injectable
class HomeLogicHolder = _HomeLogicHolderBase with _$HomeLogicHolder;

abstract class _HomeLogicHolderBase with Store {
  String getDailyFact() {
    int? selectedCategoryId = prefs.getInt(KeysNames.selectedCategoryKey);
    if (selectedCategoryId == null) {
      int randomCategory = Random().nextInt(16);
      return FactArrays.allFacts[randomCategory][factIndex];
    } else {
      return FactArrays.allFacts[selectedCategoryId][factIndex];
    }
  }
}
