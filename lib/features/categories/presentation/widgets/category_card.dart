import 'package:daily/core/extensions/color_extension.dart';
import 'package:daily/core/utils/custom_font.dart';
import 'package:daily/core/utils/popups.dart';
import 'package:daily/features/categories/presentation/items/category_item.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CategoryCard extends StatelessWidget with PopUps {
  const CategoryCard(
    this.item, {
    super.key,
  });
  final CategoryItem item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        yesNoPopUp(
          context,
          "Kategoriyi ${item.title} olarak değiştirmek istediğinize emin misiniz?",
        ).then((value) {});
      },
      child: Container(
        decoration: BoxDecoration(
          color: HexColor.fromHex(item.color).withOpacity(0.8),
          borderRadius: BorderRadius.circular(12),
          boxShadow: normalShadow,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/${item.iconPath}",
                height: context.sized.height * 0.26 * 0.4,
                fit: BoxFit.fitHeight,
              ),
              Text(
                item.title,
                style: customFont(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
