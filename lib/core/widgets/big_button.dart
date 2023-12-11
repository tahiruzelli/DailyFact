import 'package:daily/core/consts/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class BigButton extends StatelessWidget {
  final Widget title;
  final Color? color;
  final double? radius;
  final bool hasBorder;
  final bool paddingHorizontal;
  final Color? borderColor;
  final bool transparent;
  final void Function() action;
  const BigButton(
    this.title,
    this.action, {
    super.key,
    this.color,
    this.radius,
    this.hasBorder = false,
    this.paddingHorizontal = true,
    this.transparent = false,
    this.borderColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: paddingHorizontal ? context.sized.width * 0.07 : 0,
        right: paddingHorizontal ? context.sized.width * 0.07 : 0,
      ),
      width: context.sized.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 20),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              color?.withOpacity(transparent ? 0.7 : 1) ?? Colors.blueGrey,
            ),
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
