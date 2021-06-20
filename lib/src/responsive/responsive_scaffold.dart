import 'package:flutter/material.dart';
import 'package:responsive_design/src/responsive/responsive_app_bar.dart';

class ResponsiveScaffold extends StatelessWidget {
  final bool showDrawerInLargeScreen;
  final bool showDrawerInMediumScreen;

  final Widget? body;
  final Widget? drawer;

  final ResponsiveAppBar? responsiveAppBar;

  ResponsiveScaffold({
    this.showDrawerInLargeScreen = false,
    this.showDrawerInMediumScreen = false,
    this.body,
    this.drawer,
    this.responsiveAppBar,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: responsiveAppBar == null
          ? null
          : PreferredSize(
              preferredSize: Size(size.width, responsiveAppBar!.toolbarHeight),
              child: responsiveAppBar!,
            ),
      drawer: drawer,
      body: body,
    );
  }
}
