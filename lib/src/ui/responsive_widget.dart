import 'package:flutter/material.dart';
import 'package:responsive_design/src/domain/entities/responsive_settings.dart';
import 'package:responsive_design/src/domain/entities/screen_change_points.dart';
import 'package:responsive_design/src/domain/enums/responsive_type.dart';
import 'package:responsive_design/src/ui/utilities/responsive_util.dart';

/// Responsive widget that adapts to the size of the screens.
class ResponsiveWidget extends StatelessWidget {
  /// Define a [ResponsiveWidget] class.
  const ResponsiveWidget({
    Key? key,
    this.desktop,
    this.phone,
    this.tablet,
    this.watch,
    this.screenChangePoints,
  })  : assert(
          desktop != null || phone != null || tablet != null || watch != null,
          'At least one widget must not be null.',
        ),
        super(key: key);

  /// Widget to display in desktop screen.
  final Widget? desktop;

  /// Widget to display in phone screen.
  final Widget? phone;

  /// Widget to display in tablet screen.
  final Widget? tablet;

  /// Widget to display in watch screen.
  final Widget? watch;

  /// Change points to manage screen size.
  final ScreenChangePoints? screenChangePoints;

  @override
  Widget build(BuildContext context) {
    final ResponsiveType type = ResponsiveUtil(
      changePoints:
          screenChangePoints ?? ResponsiveSettings.instance.screenChangePoints,
      context: context,
    ).responsiveType;
    switch (type) {
      case ResponsiveType.desktop:
        return desktop ?? tablet ?? phone ?? watch!;
      case ResponsiveType.phone:
        return phone ?? watch ?? tablet ?? desktop!;
      case ResponsiveType.tablet:
        return tablet ?? phone ?? watch ?? desktop!;
      case ResponsiveType.watch:
        return watch ?? phone ?? tablet ?? desktop!;
    }
  }
}
