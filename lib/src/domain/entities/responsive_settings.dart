import 'package:flutter/material.dart';
import 'package:responsive_design/src/domain/enums/responsive_type.dart';

/// Manage the responsive screen settings.
class ResponsiveSettings {
  /// Define a [ResponsiveSettings] class.
  const ResponsiveSettings({
    this.desktopChangePoint = 1200.0,
    this.tabletChangePoint = 600.0,
    this.watchChangePoint = 300.0,
  });

  /// When the width is greater als this value
  /// the display will be set as [ResponsiveType.desktop]
  final double desktopChangePoint;

  /// When the width is greater als this value
  /// the display will be set as [ResponsiveType.tablet]
  /// or when width greater als [watchChangePoint] and smaller als this value
  /// the display will be [ResponsiveType.phone]
  final double tabletChangePoint;

  /// When the width is smaller als this value
  /// the display will be set as [ResponsiveType.watch]
  /// or when width greater als this value and smaller als [tabletChangePoint]
  /// the display will be [ResponsiveType.phone]
  final double watchChangePoint;

  /// Returns the [ResponsiveType] by the screen size, calculated with [context].
  ResponsiveType responsiveType(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    if (width >= desktopChangePoint) return ResponsiveType.desktop;
    if (width >= tabletChangePoint) return ResponsiveType.tablet;
    if (width < watchChangePoint) return ResponsiveType.watch;
    return ResponsiveType.phone;
  }
}
