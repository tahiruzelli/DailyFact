import 'package:daily/core/data/categories.dart';
import 'package:daily/core/locator/service_locator.dart';
import 'package:daily/core/utils/custom_font.dart';
import 'package:daily/core/widgets/custom_appbar.dart';
import 'package:daily/core/widgets/custom_textfield.dart';
import 'package:daily/core/widgets/generic_dropdown.dart';
import 'package:daily/core/widgets/gradient_button.dart';
import 'package:daily/features/suggest/presentation/logic_holder/suggest_fact_logic_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

class SuggestFactScreen extends StatelessWidget {
  SuggestFactScreen({super.key});
  final TextEditingController descriptionController = TextEditingController();
  final SuggestFactLogicHolder logicHolder = locator<SuggestFactLogicHolder>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Bilgi Öner").getStandardWidget(
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
          child: Column(
            children: [
              Observer(builder: (_) {
                return GenericDropdown(
                  items: categories,
                  upperText: "Kategori",
                  onChanged: (item) {},
                  itemText: (item) {
                    logicHolder.selectedCategory = item;
                    return item.title;
                  },
                  value: logicHolder.selectedCategory,
                );
              }),
              const SizedBox(height: 30),
              CustomTextField(
                descriptionController,
                upperText: "Bilgi",
                hintText: "",
                upperTextColor: Colors.black,
                minLines: 10,
                maxLinex: 11,
              ),
              const Spacer(),
              GradientButton(
                () {},
                Text(
                  "Gönder",
                  style: customFont(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
