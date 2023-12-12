import 'package:daily/core/widgets/custom_appbar.dart';
import 'package:daily/features/categories/presentation/items/category_item.dart';
import 'package:daily/features/categories/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Kategoriler",
      ).getStandardWidget(
        backButton: true,
        context: context,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://unblast.com/wp-content/uploads/2020/05/Light-Wood-Background-Texture-5.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: context.padding.normal,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio:
                  ((context.sized.width * 0.4) / (context.sized.height / 4)),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            controller: ScrollController(keepScrollOffset: false),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: 20,
            itemBuilder: (BuildContext context, index) {
              return CategoryCard(
                CategoryItem(
                  title: "Bilim",
                  color: "#03fc7b",
                  iconPath: "assets/images/science_image.png",
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}