import 'package:daily/core/locator/service_locator.dart';
import 'package:daily/core/utils/custom_font.dart';
import 'package:daily/core/utils/navigator.dart';
import 'package:daily/core/utils/popups.dart';
import 'package:daily/core/widgets/custom_appbar.dart';
import 'package:daily/features/categories/presentation/pages/categories_screen.dart';
import 'package:daily/features/home/presentation/logic_holder/home_logic_holder.dart';
import 'package:daily/features/home/presentation/widget/fact_card.dart';
import 'package:daily/features/suggest/presentation/pages/suggest_fact_screen.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const route = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with PopUps {
  final HomeLogicHolder logicHolder = locator<HomeLogicHolder>();
  List<Map> getSettingsData() {
    return [
      {
        "title": "Kategoriler",
        "onTap": () {
          CustomNavigator().pop(context);
          CustomNavigator().push(
            context,
            CategoriesScreen(() => setState(() {})),
          );
        }
      },
      {
        "title": "Temalar",
        "onTap": () {},
      },
      {
        "title": "Beğendiklerim",
        "onTap": () {
          CustomNavigator().pop(context);
          inDevelopmentProccessPopUp(context);
        },
      },
      {
        "title": "Bilgi Öner",
        "onTap": () {
          CustomNavigator().pop(context);
          CustomNavigator().push(context, SuggestFactScreen());
        },
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Günlük Bilgiler", acts: [
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                insetPadding: EdgeInsets.zero,
                contentPadding: context.padding.low,
                backgroundColor: Colors.transparent,
                content: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: context.sized.width,
                    color: Colors.black.withOpacity(0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        getSettingsData().length,
                        (index) {
                          return GestureDetector(
                            onTap: getSettingsData()[index]['onTap'],
                            child: Card(
                              child: SizedBox(
                                width: context.sized.width,
                                child: Padding(
                                  padding: context.padding.low,
                                  child: Center(
                                    child: Text(
                                      getSettingsData()[index]['title'],
                                      style: customFont(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          icon: const Icon(Icons.settings),
        ),
      ]).getStandardWidget(),
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FactCard(
                logicHolder.getDailyFact(),
                false,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      boxShadow: normalShadow,
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () => inDevelopmentProccessPopUp(context),
                      icon: Image.asset(
                        "assets/icons/like_icon.png",
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => inDevelopmentProccessPopUp(context),
                    child: Container(
                      width: context.sized.width * 0.7,
                      height: 50,
                      decoration: BoxDecoration(
                        boxShadow: normalShadow,
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          "Yeni Bilgi",
                          style: customFont(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.sized.height / 4),
            ],
          ),
        ),
      ),
    );
  }
}
