import 'package:flutter/material.dart';

/// It must be used in a ResponsiveAppBar in actions.
class AppBarAction extends StatelessWidget {
  /// The primary widget displayed in the app bar action.
  final Widget child;

  /// Indicates if the action should be shown on medium screens.
  /// Default is false
  final bool showInMediumScreen;

  /// Indicates if the action should be shown in small screens.
  /// Default is false
  final bool showInSmallScreen;

  const AppBarAction({
    Key? key,
    required this.child,
    this.showInMediumScreen = false,
    this.showInSmallScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
