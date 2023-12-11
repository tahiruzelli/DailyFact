import 'package:daily/core/consts/colors/colors.dart';
import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final Widget title;
  final Color? color;
  final double? radius;
  final bool hasBorder;
  final bool paddingHorizontal;
  final Color? borderColor;
  final void Function() action;
  const BigButton(
    this.title,
    this.action, {
    super.key,
    this.color,
    this.radius,
    this.hasBorder = false,
    this.paddingHorizontal = true,
    this.borderColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 25.0,
        left: paddingHorizontal ? context.size!.width * 0.07 : 0,
        right: paddingHorizontal ? context.size!.width * 0.07 : 0,
      ),
      width: context.size!.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 20),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(color ?? Colors.blueGrey),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 16),
            ),
            shape: hasBorder
                ? MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius ?? 20),
                      side: BorderSide(
                        color: borderColor ?? AppColors.primaryColor2,
                        width: 1.5,
                      ),
                    ),
                  )
                : null,
          ),
          onPressed: action,
          child: title,
        ),
      ),
    );
  }
}
