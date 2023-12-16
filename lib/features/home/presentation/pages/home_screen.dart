import 'package:daily/core/localization/init/locale_keys.g.dart';
import 'package:daily/core/locator/service_locator.dart';
import 'package:daily/core/logger/logger.dart';
import 'package:daily/core/utils/custom_font.dart';
import 'package:daily/core/widgets/custom_appbar.dart';
import 'package:daily/features/home/presentation/logic_holder/home_logic_holder.dart';
import 'package:daily/features/home/presentation/widget/fact_card.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static const route = "/home";
  final HomeLogicHolder logicHolder = locator<HomeLogicHolder>();
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
                        logicHolder.getSettingsData(context).length,
                        (index) {
                          return GestureDetector(
                            onTap: logicHolder.getSettingsData(context)[index]
                                ['onTap'],
                            child: Card(
                              child: SizedBox(
                                width: context.sized.width,
                                child: Padding(
                                  padding: context.padding.low,
                                  child: Center(
                                    child: Text(
                                      logicHolder.getSettingsData(
                                          context)[index]['title'],
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
              const FactCard(
                LocaleKeys.art_100,
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
                      onPressed: () {
                        logPrint("test");
                      },
                      icon: Image.asset(
                        "assets/icons/like_icon.png",
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      logPrint("text");
                    },
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
