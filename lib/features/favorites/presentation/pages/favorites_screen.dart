import 'package:daily/core/widgets/custom_appbar.dart';
import 'package:daily/features/home/presentation/widget/fact_card.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Beğendiklerim",
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
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const FactCard(
                "Pisa Kulesi'nin üzerine kurulu olduğu, daha inşaat bitmeden eğilmeye başlamasına sebep olan yumuşak toprak, kulenin 4 farklı depremden sağlam çıkmasını sağlamıştır",
                true,
              );
            },
          ),
        ),
      ),
    );
  }
}
