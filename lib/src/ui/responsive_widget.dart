import 'package:flutter/material.dart';
import 'package:responsive_design/responsive_design.dart';

/// Responsive widget that adapts to the size of the screens.
class ResponsiveWidget extends StatelessWidget {
  /// Define a [ResponsiveWidget] class.
  const ResponsiveWidget({
    Key? key,
    this.responsiveSettings = const ResponsiveSettings(),
    this.desktop,
    this.phone,
    this.tablet,
    this.watch,
  })  : assert(
          desktop != null || phone != null || tablet != null || watch != null,
          'At least one widget must not be null.',
        ),
        super(key: key);

  /// Responsive settings to manage the with of the screen.
  final ResponsiveSettings responsiveSettings;

  /// Widget to display in desktop screen.
  final Widget? desktop;

  /// Widget to display in phone screen.
  final Widget? phone;

  /// Widget to display in tablet screen.
  final Widget? tablet;

  /// Widget to display in watch screen.
  final Widget? watch;

  @override
  Widget build(BuildContext context) {
    final ResponsiveType type = responsiveSettings.responsiveType(context);
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
