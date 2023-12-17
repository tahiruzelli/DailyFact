import 'package:daily/core/data/categories.dart';
import 'package:daily/core/widgets/custom_appbar.dart';
import 'package:daily/features/categories/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(this.callback, {super.key});
  final VoidCallback callback;
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
            image: AssetImage(
              "assets/images/background.png",
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
                  ((context.sized.width * 0.4) / (context.sized.height * 0.22)),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            controller: ScrollController(keepScrollOffset: false),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, index) {
              return CategoryCard(
                categories[index],
                callback,
              );
            },
          ),
        ),
      ),
    );
  }
}
