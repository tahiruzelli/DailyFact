import 'package:daily/core/utils/custom_font.dart';
import 'package:daily/core/widgets/big_button.dart';
import 'package:daily/core/widgets/gradient_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin PopUps {
  Future inDevelopmentProccessPopUp(BuildContext context) {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          "Geliştirme sürecinde",
          style: customFont(),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              "OK",
              style: customFont(),
            ),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  Future yesNoPopUp(
    BuildContext context,
    String content,
  ) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          content,
          style: customFont(),
          textAlign: TextAlign.center,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: context.size!.height / 3,
                child: BigButton(
                  Text(
                    "Hayır",
                    style: customFont(
                      color: Colors.red,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  () => Navigator.pop(context, false),
                  hasBorder: true,
                  color: Colors.white,
                  borderColor: Colors.red,
                  paddingHorizontal: false,
                  radius: 10,
                ),
              ),
              Container(
                width: context.size!.width / 3,
                margin: const EdgeInsets.only(bottom: 25),
                child: GradientButton(
                  () => Navigator.pop(context, true),
                  Text(
                    "Evet",
                    style: customFont(
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
