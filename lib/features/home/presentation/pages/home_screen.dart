import 'package:daily/core/logger/logger.dart';
import 'package:daily/core/utils/custom_font.dart';
import 'package:daily/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const route = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Günlük Bilgiler", acts: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings),
        ),
      ]).getStandardWidget(),
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: context.padding.normal,
                decoration: BoxDecoration(
                  boxShadow: normalShadow,
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Pisa Kulesi'nin üzerine kurulu olduğu, daha inşaat bitmeden eğilmeye başlamasına sebep olan yumuşak toprak, kulenin 4 farklı depremden sağlam çıkmasını sağlamıştır",
                  style: customFont(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      boxShadow: normalShadow,
                      color: Colors.white.withOpacity(0.7),
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
                        color: Colors.white.withOpacity(0.7),
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
