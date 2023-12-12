import 'package:daily/core/utils/custom_font.dart';
import 'package:daily/core/utils/popups.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class FactCard extends StatelessWidget with PopUps {
  const FactCard(this.description, this.isFavorite, {super.key});
  final String description;
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: context.padding.normal,
          margin: context.padding.onlyBottomLow,
          decoration: BoxDecoration(
            boxShadow: normalShadow,
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            description,
            style: customFont(
              fontSize: 16,
            ),
          ),
        ),
        isFavorite
            ? Positioned(
                top: 10,
                right: 10,
                child: InkWell(
                  onTap: () async {
                    await yesNoPopUp(context,
                        "Beğendikleriniz arasından kaldırmak istediğinize emin misiniz?");
                  },
                  child: Image.asset("assets/icons/dislike_icon.png"),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
