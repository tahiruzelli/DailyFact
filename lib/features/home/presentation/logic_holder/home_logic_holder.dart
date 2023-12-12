import 'package:daily/core/utils/navigator.dart';
import 'package:daily/features/categories/presentation/pages/categories_screen.dart';
import 'package:daily/features/favorites/presentation/pages/favorites_screen.dart';
import 'package:daily/features/suggest/presentation/pages/suggest_fact_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
part 'home_logic_holder.g.dart';

@injectable
class HomeLogicHolder = _HomeLogicHolderBase with _$HomeLogicHolder;

abstract class _HomeLogicHolderBase with Store {
  List<Map> getSettingsData(BuildContext context) {
    return [
      {
        "title": "Kategoriler",
        "onTap": () {
          CustomNavigator().pop(context);
          CustomNavigator().push(context, const CategoriesScreen());
        }
      },
      {
        "title": "Temalar",
        "onTap": () {},
      },
      {
        "title": "Beğendiklerim",
        "onTap": () {
          CustomNavigator().pop(context);
          CustomNavigator().push(context, const FavoritesScreen());
        },
      },
      {
        "title": "Bilgi Öner",
        "onTap": () {
          CustomNavigator().pop(context);
          CustomNavigator().push(context,  SuggestFactScreen());
        },
      },
    ];
  }
}
