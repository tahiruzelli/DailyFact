import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton(this.voidCallback, this.child,
      {this.bgColor, super.key});
  final VoidCallback voidCallback;
  final Widget child;
  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => voidCallback(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: bgColor != null
              ? null
              : const LinearGradient(
                  begin: Alignment(-0.975, -0.654),
                  end: Alignment(0.973, 0.865),
                  colors: <Color>[
                    Color(0xff00b0ea),
                    Color(0xff0470a8),
                    Color(0xff0a295f)
                  ],
                  stops: <double>[0, 0.47, 1],
                ),
          color: bgColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
