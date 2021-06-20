import 'package:flutter/material.dart';

/// It must be used in a ResponsiveAppBar in actions.
class AppBarAction extends StatelessWidget {
  ///
  final Widget child;

  /// Indicates if the action should be shown on medium screens.
  /// Default is false
  final bool showInMediumScreen;

  /// Indicates if the action should be shown in small screens.
  /// Default is false
  final bool showInSmallScreen;

  AppBarAction({
    required this.child,
    this.showInMediumScreen = false,
    this.showInSmallScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
