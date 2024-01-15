import 'package:flutter/material.dart';
import 'package:meditofundraising/constants/styles/widget_styles.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < minTabletSize;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < maxTabletSize &&
      MediaQuery.of(context).size.width >= minTabletSize;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= maxTabletSize;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // If our width is more than 1100 then we consider it a desktop
    if (size.width >= maxTabletSize) {
      return desktop;
    }
    // If width is less then 1100 and more then 850 we consider it as tablet
    else if (size.width >= minTabletSize && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}
