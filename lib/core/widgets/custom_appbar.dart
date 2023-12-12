import 'package:flutter/material.dart';
import 'package:daily/core/utils/custom_font.dart';

class CustomAppBar {
  String title;

  Color backgroundColor = Colors.blue;

  Color textColor = Colors.white;

  Color iconsColor = Colors.white;

  List<Widget> actions;

  bool centerTitle;

  CustomAppBar(
      {this.title = "",
      this.backgroundColor = Colors.transparent,
      this.textColor = Colors.black,
      this.iconsColor = Colors.white,
      this.centerTitle = true,
      List<Widget>? acts})
      : actions = acts ?? [];

  AppBar getStandardWidget(
      {Widget? leading, bool backButton = false, BuildContext? context}) {
    return AppBar(
      automaticallyImplyLeading: true,
      surfaceTintColor: Colors.black,
      elevation: 0,
      iconTheme: IconThemeData(
        size: 30,
        color: iconsColor,
      ),
      title: title.isEmpty
          ? null
          : Text(
              title,
              style: customFont(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.975, -0.654),
            end: Alignment(0.973, 0.865),
            colors: <Color>[
              Color(0xff00b0ea),
              Color(0xff0470a8),
              Color(0xff0a295f)
            ],
            stops: <double>[0, 0.47, 1],
          ),
        ),
      ),
      actions: actions,
      centerTitle: centerTitle,
      leading: backButton
          ? IconButton(
              // onPressed: () => CustomNavigator().pop(context!),
              onPressed: () => Navigator.maybePop(context!),
              icon: Icon(
                Icons.chevron_left,
                color: iconsColor,
              ),
            )
          : leading ?? Container(),
    );
  }
}
