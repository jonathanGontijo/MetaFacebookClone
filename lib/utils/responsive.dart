import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive(
      {super.key, required this.mobile, required this.desktop, this.tablet});

  static bool IsMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool IsTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 &&
        MediaQuery.of(context).size.width < 1200;
  }

  static bool IsDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1200) {
        return desktop;
      } else if (constraints.maxWidth >= 800) {
        Widget? resTablet = this.tablet;
        if (resTablet != null) {
          return resTablet;
        }
        return this.mobile;
      } else {
        return mobile;
      }
    });
  }
}
