import 'package:flutter/material.dart';

enum Locals {
  tr(Locale("tr", "TR")),
  en(Locale("en", "US "));

  final Locale locale;
  const Locals(this.locale);

}
