import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_design/src/domain/entities/screen_change_points.dart';
import 'package:responsive_design/src/domain/enums/responsive_type.dart';

/// Utilitie to check the screen size by device.
class ResponsiveUtil {
  /// Define a [ResponsiveUtil] class.
  const ResponsiveUtil({
    required this.changePoints,
    required this.context,
  });

  /// Required change points to verify the screen size.
  final ScreenChangePoints changePoints;

  /// Context to get the current height and width of the screen.
  final BuildContext context;

  double get _deviceWidth {
    return width;
  }

  /// Current height of the screen.
  double get height => MediaQuery.of(context).size.height;

  /// Returns true if screen size is desktop.
  bool get isDesktop => responsiveType == ResponsiveType.desktop;

  /// Returns true if screen size is phone.
  bool get isPhone => responsiveType == ResponsiveType.phone;

  /// Returns true if screen size is tablet.
  bool get isTablet => responsiveType == ResponsiveType.tablet;

  /// Returns true if screen size is watch.
  bool get isWatch => responsiveType == ResponsiveType.watch;

  /// Current width of the screen.
  double get width => MediaQuery.of(context).size.width;

  /// Returns the responsive type depending of the screen size.
  ResponsiveType get responsiveType {
    final double deviceWidth = _deviceWidth;
    if (deviceWidth >= changePoints.desktopChangePoint) {
      return ResponsiveType.desktop;
    }
    if (deviceWidth >= changePoints.tabletChangePoint) {
      return ResponsiveType.tablet;
    }
    if (deviceWidth < changePoints.watchChangePoint) {
      return ResponsiveType.watch;
    }
    return ResponsiveType.phone;
  }
}
