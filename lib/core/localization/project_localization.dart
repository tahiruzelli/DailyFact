import 'package:daily/core/consts/enums/locales.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

@immutable
final class ProjectLocalization extends EasyLocalization {
  ProjectLocalization({
    required super.child,
    super.key,
  }) : super(
          supportedLocales: _supportedItems,
          path: _translationPath,
          useOnlyLangCode: true,
        );
  static final List<Locale> _supportedItems = [
    Locals.tr.locale,
    Locals.en.locale,
  ];

  static const String _translationPath = 'assets/translations';

  static Future<void> updateLanguage(
          {required BuildContext context, required Locals value}) =>
      context.setLocale(value.locale);
}
