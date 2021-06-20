import 'package:flutter/material.dart';
import 'package:responsive_design/src/responsive/responsive.dart';
import 'package:responsive_design/src/widgets/app_bar_action.dart';

/// An AppBar that adapts to different screen densities,
/// the actions appear only when the screen is large.
class ResponsiveAppBar extends StatelessWidget {
  final List<AppBarAction>? actions;
  final Widget? title;
  final double toolbarHeight;

  ResponsiveAppBar({
    this.actions,
    this.title,
    this.toolbarHeight = kToolbarHeight,
  });

  @override
  Widget build(BuildContext context) {
    if (Responsive.isLargeScreen(context)) return _appBarLarge();
    if (Responsive.isMediumScreen(context)) return _appBarMedium();
    return _appBarSmall();
  }

  Widget _appBarSmall() {
    return AppBar(
      title: title,
      actions: [...?actions?.where((act) => act.showInSmallScreen)],
    );
  }

  Widget _appBarMedium() {
    return AppBar(
      title: title,
      actions: [...?actions?.where((act) => act.showInMediumScreen)],
    );
  }

  Widget _appBarLarge() {
    return AppBar(
      title: title,
      actions: actions,
    );
  }
}
