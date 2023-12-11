import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GetIcon {
  static const String iconPath = "assets/icons/arrow.svg";
  Widget getLeft({double? height, double? width}) {
    return Transform.rotate(
      angle: math.pi / 2,
      child: SvgPicture.asset(
        iconPath,
        height: height,
        width: width,
      ),
    );
  }

  Widget getRight({double? height, double? width}) {
    return Transform.rotate(
      angle: -math.pi / 2,
      child: SvgPicture.asset(
        iconPath,
        height: height,
        width: width,
      ),
    );
  }

  Widget getBottom({double? height, double? width}) {
    return SvgPicture.asset(
      iconPath,
      height: height,
      width: width,
    );
  }

  Widget getTop({double? height, double? width}) {
    return Transform.rotate(
      angle: -math.pi,
      child: SvgPicture.asset(
        iconPath,
        height: height,
        width: width,
      ),
    );
  }
}

// Transform.rotate
// -math.pi / 4 //45 degree
// math.pi / 4 //-45 degree
// -math.pi / 2 //90 degree
// math.pi / 2  //-90 degree
// -math.pi // 180 degree