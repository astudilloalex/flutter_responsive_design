import 'package:flutter/material.dart';

/// It must be used in a ResponsiveAppBar in actions.
class AppBarAction extends StatelessWidget {
  final Widget child;
  final bool showInMediumScreen;
  final bool showInSmallScreen;

  AppBarAction({
    required this.child,
    this.showInMediumScreen = true,
    this.showInSmallScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
