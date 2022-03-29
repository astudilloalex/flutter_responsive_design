import 'package:responsive_design/src/domain/entities/screen_change_points.dart';

/// Manage the responsive screen settings.
class ResponsiveSettings {
  ResponsiveSettings._();
  ScreenChangePoints changePoints = const ScreenChangePoints();

  static ResponsiveSettings? _instance;

  // ignore: prefer_constructors_over_static_methods
  static ResponsiveSettings get instance {
    return _instance ??= ResponsiveSettings._();
  }
}
