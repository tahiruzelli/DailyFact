import 'package:daily/core/consts/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:daily/core/utils/custom_font.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String? hintText;
  final Widget? icon;
  final bool? isEnabled;
  final TextAlignVertical textAlignVertical;
  final Function(String)? function;
  final Color? bgColor;
  final bool hasBorder;
  final int minLines;
  final bool isNumberOnly;
  final double upperTextPadding;
  final int maxLinex;
  final VoidCallback? onTap;
  final bool obscureText;
  final bool onlyLetters;
  final String? upperText;
  final Color borderColor;
  final Color upperTextColor;
  final Color? openEyeColor;
  final String? autofillHints;
  const CustomTextField(this.textEditingController,
      {super.key,
      this.hintText,
      this.icon,
      this.textAlignVertical = TextAlignVertical.top,
      this.function,
      this.isEnabled = true,
      this.hasBorder = true,
      this.bgColor = Colors.white,
      this.minLines = 1,
      this.isNumberOnly = false,
      this.upperTextPadding = 6,
      this.maxLinex = 3,
      this.onTap,
      this.obscureText = false,
      this.onlyLetters = false,
      this.upperText,
      this.openEyeColor = Colors.grey,
      this.autofillHints,
      this.upperTextColor = AppColors.primaryColor,
      this.borderColor = Colors.grey});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isPasswordVisible;
  @override
  void initState() {
    isPasswordVisible = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.upperText != null
              ? Padding(
                  padding: EdgeInsets.only(
                    bottom: widget.upperTextPadding,
                    top: widget.upperTextPadding,
                    left: 4,
                  ),
                  child: Text(
                    widget.upperText!,
                    style: customFont(
                      color: widget.upperTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              : Container(),
          TextField(
            obscureText: widget.obscureText ? isPasswordVisible : false,
            controller: widget.textEditingController,
            enabled: widget.isEnabled,
            cursorColor: widget.borderColor,
            autofillHints: widget.autofillHints == null
                ? []
                : [
                    widget.autofillHints!,
                  ],
            textCapitalization: widget.onlyLetters
                ? TextCapitalization.words
                : TextCapitalization.none,
            style: customFont(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: widget.borderColor,
            ),
            onChanged: (value) {
              if (widget.function != null) {
                widget.function!(value);
              }
            },
            onTap: () {
              if (widget.onTap != null) {
                widget.onTap!();
              }
            },
            keyboardType:
                widget.isNumberOnly ? TextInputType.number : TextInputType.text,
            minLines: widget.minLines,
            maxLines: widget.obscureText ? 1 : widget.maxLinex,
            textAlignVertical: widget.textAlignVertical,
            inputFormatters: widget.isNumberOnly
                ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
                : widget.obscureText || !widget.onlyLetters
                    ? null
                    : <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                          RegExp(r"[A-Za-zğüşöçıİĞÜŞÖÇ]+|\s"),
                        ),
                      ],
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              border: widget.hasBorder ? border() : null,
              enabledBorder: widget.hasBorder ? border() : null,
              focusedBorder: widget.hasBorder ? border() : null,
              disabledBorder: widget.hasBorder ? border() : null,
              hintText: widget.hintText ?? widget.upperText,
              hintStyle: customFont(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: widget.borderColor,
              ),
              prefixIcon: widget.icon,
              suffixIcon: widget.obscureText
                  ? IconButton(
                      icon: SvgPicture.asset(
                        "assets/icons/closed_eye.svg",
                        colorFilter: ColorFilter.mode(
                            !isPasswordVisible
                                ? Colors.black
                                : widget.openEyeColor!,
                            BlendMode.srcIn),
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: widget.borderColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
