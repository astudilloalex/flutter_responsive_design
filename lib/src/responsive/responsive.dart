import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  static const double largeMinSize = 1100;
  static const double smallMaxSize = 600;

  final Widget? largeScreen;
  final Widget? mediumScreen;
  final Widget smallScreen;

  Responsive({
    this.largeScreen,
    this.mediumScreen,
    required this.smallScreen,
  });

  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < smallMaxSize;

  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < largeMinSize &&
      MediaQuery.of(context).size.width >= smallMaxSize;

  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= largeMinSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.maxWidth >= largeMinSize)
          return largeScreen ?? smallScreen;
        if (constraints.maxWidth >= smallMaxSize)
          return mediumScreen ?? smallScreen;
        return smallScreen;
      },
    );
  }
}
