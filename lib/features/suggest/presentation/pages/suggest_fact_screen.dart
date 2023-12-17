import 'package:daily/core/data/categories.dart';
import 'package:daily/core/locator/service_locator.dart';
import 'package:daily/core/utils/custom_font.dart';
import 'package:daily/core/utils/custom_snackbar.dart';
import 'package:daily/core/utils/navigator.dart';
import 'package:daily/core/widgets/custom_appbar.dart';
import 'package:daily/core/widgets/custom_textfield.dart';
import 'package:daily/core/widgets/generic_dropdown.dart';
import 'package:daily/core/widgets/gradient_button.dart';
import 'package:daily/core/widgets/loading_indicator.dart';
import 'package:daily/features/suggest/presentation/logic_holder/suggest_fact_logic_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

class SuggestFactScreen extends StatelessWidget with SnackBars {
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
            image: AssetImage(
              "assets/images/background.png",
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
                  onChanged: (item) {
                    logicHolder.selectedCategory = item;
                  },
                  itemText: (item) {
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
                () {
                  if (logicHolder.selectedCategory == null) {
                    warningSnackBar(context, "Kategori seçmeniz gerekmektedir");
                  } else if (descriptionController.text.length < 20) {
                    warningSnackBar(context,
                        "Minimum 20 karakterlık bilgi girmeniz gerekmektedir");
                  } else {
                    logicHolder
                        .addSuggest(
                      descriptionController.text,
                    )
                        .then((value) {
                      if (value.isRight()) {
                        successSnackBar(context, "Öneriniz için teşekkürler");
                        CustomNavigator().pop(context);
                      } else {
                        errorSnackBar(
                            context, "Önerinizi alırken bir problem oluştu");
                      }
                    });
                  }
                },
                Observer(builder: (_) {
                  return logicHolder.isAddSuggestButtonLoading
                      ? const LoadingIndicator()
                      : Text(
                          "Gönder",
                          style: customFont(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        );
                }),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
