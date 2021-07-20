import 'package:flutter/material.dart';
import 'package:responsive_design/src/common/constants.dart';

/// Responsive widget returns different child depending on the screen size.
class Responsive extends StatelessWidget {
  /// Widget that will be displayed on large screens.
  final Widget? largeScreen;

  /// Widget that will be displayed on medium screens.
  final Widget? mediumScreen;

  /// Widget that will be displayed on small screens.
  final Widget smallScreen;

  const Responsive({
    Key? key,
    this.largeScreen,
    this.mediumScreen,
    required this.smallScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.maxWidth >= kLargeScreenMinWidth) {
          return largeScreen ?? smallScreen;
        }
        if (constraints.maxWidth > kSmallScreenMaxWidth) {
          return mediumScreen ?? smallScreen;
        }
        return smallScreen;
      },
    );
  }
}
