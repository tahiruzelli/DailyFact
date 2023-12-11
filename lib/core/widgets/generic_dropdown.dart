import 'package:daily/core/utils/custom_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GenericDropDown<T> extends StatefulWidget {
  const GenericDropDown(this.dropDownList,
      {this.upperText,
      this.callBack,
      this.currentIndex,
      this.isSearchable = false,
      this.isEnabled,
      super.key});
  final List<T?> dropDownList;
  final String? upperText;
  final int? currentIndex;
  final Function(int pressedIndex)? callBack;
  final bool isSearchable;
  final bool? isEnabled;
  @override
  State<GenericDropDown> createState() => _GenericDropDownState();
}

class _GenericDropDownState<T> extends State<GenericDropDown<T>> {
  late T? dropDownValue;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.currentIndex == null) {
      dropDownValue = null;
    } else {
      dropDownValue = widget.dropDownList[widget.currentIndex!];
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.upperText != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 6, top: 6, left: 4),
                child: Text(
                  widget.upperText!,
                  style: customFont(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            : Container(),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: DropdownButton<T?>(
              value: dropDownValue,
              iconSize: 20,
              hint: Text(
                "Seçiniz",
                style: customFont(),
              ),
              icon: Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child:
                          SvgPicture.asset("assets/icons/arrow_down_icon.svg"),
                    ),
                  ),
                ),
              ),
              underline: Container(),
              items: widget.dropDownList.map<DropdownMenuItem<T>>((T? value) {
                return DropdownMenuItem<T>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (value) {
                if (widget.callBack != null) {
                  widget.callBack!(widget.dropDownList.indexOf(value));
                }
                setState(() {
                  dropDownValue = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
