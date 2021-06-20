import 'package:flutter/material.dart';

/// Responsive widget returns different child depending on the screen size.
class Responsive extends StatelessWidget {
  /// Minimum size of a large screen => 1100.
  static const double largeMinSize = 1100;

  /// Maximum size of a small screen => 600.
  static const double smallMaxSize = 600;

  /// Widget that will be displayed on large screens.
  final Widget? largeScreen;

  /// Widget that will be displayed on medium screens.
  final Widget? mediumScreen;

  /// Widget that will be displayed on small screens.
  final Widget smallScreen;

  Responsive({
    this.largeScreen,
    this.mediumScreen,
    required this.smallScreen,
  });

  /// Returns true if screen size is small, requires BuildContext.
  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < smallMaxSize;

  /// Returns true if screen size is medium, requires BuildContext.
  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < largeMinSize &&
      MediaQuery.of(context).size.width >= smallMaxSize;

  /// Returns true if screen size is large, requires BuildContext.
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
