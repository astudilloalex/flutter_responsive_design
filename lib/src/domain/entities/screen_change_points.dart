import 'package:responsive_design/src/domain/enums/responsive_type.dart';

/// Manage the responsive change points.
class ScreenChangePoints {
  /// Define a [ScreenChangePoints] class.
  const ScreenChangePoints({
    this.desktopChangePoint = 1200.0,
    this.tabletChangePoint = 600.0,
    this.watchChangePoint = 300.0,
  });

  /// When the width is greater than this value
  /// the display will be set as [ResponsiveType.desktop]
  final double desktopChangePoint;

  /// When the width is greater than this value
  /// the display will be set as [ResponsiveType.tablet]
  /// or when width greater als [watchChangePoint] and smaller als this value
  /// the display will be [ResponsiveType.phone]
  final double tabletChangePoint;

  /// When the width is smaller than this value
  /// the display will be set as [ResponsiveType.watch]
  /// or when width greater als this value and smaller als [tabletChangePoint]
  /// the display will be [ResponsiveType.phone]
  final double watchChangePoint;
}
