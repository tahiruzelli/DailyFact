// import 'package:daily/core/utils/custom_font.dart';
// import 'package:daily/features/categories/presentation/items/category_item.dart';
// import 'package:flutter/material.dart';

// class GenericDropDown<T> extends StatefulWidget {
//   final T value;
//   final List<T?> items;
//   final String Function(T) itemText;
//   final Function(T?) onChanged;
//   final String? upperText;
//   final int? currentIndex;

//   const GenericDropDown(
//       {super.key,
//       this.upperText,
//       this.currentIndex,
//       required this.value,
//       required this.items,
//       required this.itemText,
//       required this.onChanged});

//   @override
//   State<GenericDropDown> createState() => _GenericDropDownState();
// }

// class _GenericDropDownState<T> extends State<GenericDropDown<T>> {
//   late T? dropDownValue;
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (widget.currentIndex == null) {
//       dropDownValue = null;
//     } else {
//       dropDownValue = widget.items[widget.currentIndex!];
//     }
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         widget.upperText != null
//             ? Padding(
//                 padding: const EdgeInsets.only(bottom: 6, top: 6, left: 4),
//                 child: Text(
//                   widget.upperText!,
//                   style: customFont(
//                     color: Colors.grey,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               )
//             : Container(),
//         Container(
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: Colors.grey,
//             ),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.only(left: 8.0),
//             child: DropdownButton<T>(
//               value: dropDownValue,
//               iconSize: 20,
//               hint: Text(
//                 "Seçiniz",
//                 style: customFont(),
//               ),
//               // icon: Expanded(
//               //   child: Align(
//               //     alignment: Alignment.centerRight,
//               //     child: SizedBox(
//               //       child: Padding(
//               //         padding: const EdgeInsets.only(right: 8.0),
//               //         child:
//               //             SvgPicture.asset("assets/icons/arrow_down_icon.svg"),
//               //       ),
//               //     ),
//               //   ),
//               // ),
//               underline: Container(),
//               items: widget.items.map<DropdownMenuItem<T>>((T? value) {
//                 print(widget.itemText(value!));
//                 return DropdownMenuItem<T>(
//                   value: value,
//                   child: Text("widget.itemText(value)"),
//                 );
//               }).toList(),
//               onChanged: (item) {
//                 // widget.onChanged(item);
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:daily/core/utils/custom_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GenericDropdown<T> extends StatefulWidget {
  final List<T> items;
  final String Function(T) itemText;
  final Function(T) onChanged;
  final String? upperText;
  final T? value;
  const GenericDropdown(
      {super.key,
      this.upperText,
      this.value,
      required this.items,
      required this.itemText,
      required this.onChanged});

  @override
  State<GenericDropdown<T>> createState() => _GenericDropdownState<T>();
}

class _GenericDropdownState<T> extends State<GenericDropdown<T>> {
  T? dropDownValue;

  @override
  Widget build(BuildContext context) {
    // if (widget.currentIndex == null) {
    //   dropDownValue = null;
    // } else {
    //   dropDownValue = widget.items[widget.currentIndex!];
    // }
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
          child: DropdownButton<T>(
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
                    child: SvgPicture.asset("assets/icons/arrow_down_icon.svg"),
                  ),
                ),
              ),
            ),
            underline: const SizedBox(),
            items: widget.items.map((T item) {
              return DropdownMenuItem<T>(
                value: item,
                child: Text(widget.itemText(item)),
              );
            }).toList(),
            onChanged: (item) {
              setState(() {
                dropDownValue = item;
              });
              widget.onChanged(item!);
            },
          ),
        ),
      ],
    );
  }
}
