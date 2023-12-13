import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

mixin SnackBars {
  void warningSnackBar(BuildContext context, String title) {
    ScaffoldMessenger.maybeOf(context)?.clearSnackBars();
    final snackBar = SnackBar(
      content: AwesomeSnackbarContent(
        title: "Uyarı",
        message: title,
        contentType: ContentType.warning,
      ),
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.fixed,
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void infoSnackBar(BuildContext context, String title) {
    ScaffoldMessenger.maybeOf(context)?.clearSnackBars();
    final snackBar = SnackBar(
      content: AwesomeSnackbarContent(
        title: "Bilgi",
        message: title,
        contentType: ContentType.help,
      ),
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.fixed,
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void successSnackBar(BuildContext context, String title) {
    ScaffoldMessenger.maybeOf(context)?.clearSnackBars();
    final snackBar = SnackBar(
      content: AwesomeSnackbarContent(
        title: "Başarı",
        message: title,
        contentType: ContentType.success,
      ),
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.fixed,
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void errorSnackBar(BuildContext context, String title) {
    ScaffoldMessenger.maybeOf(context)?.clearSnackBars();
    final snackBar = SnackBar(
      content: AwesomeSnackbarContent(
        title: "Hata",
        message: title,
        contentType: ContentType.failure,
      ),
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.fixed,
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
