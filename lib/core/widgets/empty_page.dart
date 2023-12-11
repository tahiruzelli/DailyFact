import 'package:daily/core/utils/custom_font.dart';
import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget? header;
  final Widget? footer;
  const EmptyPage(this.title, this.subTitle, {this.header,this.footer, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        header ?? Container(),
        const Spacer(),
        SizedBox(
          width: context.size!.width,
          child: Image.asset(
            "assets/images/empty_screen.png",
            height: context.size!.height / 3,
            width: context.size!.width,
            fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(height: 50),
        Text(
          title,
          style: customFont(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            subTitle,
            style: customFont(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
        footer ?? Container(),
      ],
    );
  }
}
