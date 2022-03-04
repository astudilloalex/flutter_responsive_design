import 'package:flutter/material.dart';

/// It must be used in a ResponsiveAppBar in actions.
class AppBarAction extends StatelessWidget {
  /// Define a [AppBarAction] widget.
  const AppBarAction(
    this.child, {
    Key? key,
    this.showInAllScreens = false,
    this.showInDesktop = true,
    this.showInPhone = false,
    this.showInTablet = false,
    this.showInWatch = false,
  }) : super(key: key);

  /// The primary widget displayed in the app bar action.
  final Widget child;

  /// Indicates if the action should be shown in all screens.
  ///
  /// If true the other indications [showInDesktop], [showInPhone], [showInTablet]
  /// and [showInWatch] will be ignored.
  ///
  /// Default is false.
  final bool showInAllScreens;

  /// Indicates if the action should be shown on desktop screens.
  ///
  /// Default is true.
  final bool showInDesktop;

  /// Indicates if the action should be shown on phone screens.
  ///
  /// Default is false.
  final bool showInPhone;

  /// Indicates if the action should be shown on tablet screens.
  ///
  /// Default is false.
  final bool showInTablet;

  /// Indicates if the action should be shown on watch screens.
  ///
  /// Default is false.
  final bool showInWatch;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
