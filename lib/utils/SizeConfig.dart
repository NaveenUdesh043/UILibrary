import 'package:flutter/widgets.dart';

import 'package:flutter/widgets.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }

  /// Width as % of screen width
  static double width(double widthPercent) => screenWidth * (widthPercent / 100);

  /// Height as % of screen height
  static double height(double heightPercent) => screenHeight * (heightPercent / 100);

  /// Font size scaled to screen width
  static double sp(double sizePercent) => screenWidth * (sizePercent / 100);

  // -----------------------------
  // 📦 Padding & Margin
  // -----------------------------

  static EdgeInsets paddingAll(double percent) => EdgeInsets.all(width(percent));

  static EdgeInsets paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      EdgeInsets.symmetric(horizontal: width(horizontal), vertical: height(vertical));

  static EdgeInsets paddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      EdgeInsets.only(
        left: width(left),
        top: height(top),
        right: width(right),
        bottom: height(bottom),
      );

  static EdgeInsets marginAll(double percent) => EdgeInsets.all(width(percent));

  static EdgeInsets marginSymmetric({double horizontal = 0, double vertical = 0}) =>
      EdgeInsets.symmetric(horizontal: width(horizontal), vertical: height(vertical));

  static EdgeInsets marginOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      EdgeInsets.only(
        left: width(left),
        top: height(top),
        right: width(right),
        bottom: height(bottom),
      );

  // -----------------------------
  // 🟣 Border Radius
  // -----------------------------
  static BorderRadius radiusAll(double percent) => BorderRadius.circular(width(percent));

  static BorderRadius radiusOnly({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) =>
      BorderRadius.only(
        topLeft: Radius.circular(width(topLeft)),
        topRight: Radius.circular(width(topRight)),
        bottomLeft: Radius.circular(width(bottomLeft)),
        bottomRight: Radius.circular(width(bottomRight)),
      );

  // -----------------------------
  // ➕ Spacer / Gap Helper
  // -----------------------------
  static SizedBox gapW(double percent) => SizedBox(width: width(percent));
  static SizedBox gapH(double percent) => SizedBox(height: height(percent));
}
