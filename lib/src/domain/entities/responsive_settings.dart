import 'package:responsive_design/src/domain/entities/screen_change_points.dart';

/// Manage the responsive screen settings.
class ResponsiveSettings {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  ResponsiveSettings._();

  ScreenChangePoints _screeChangePoints = const ScreenChangePoints();
  double? _screenMaxWidth;
  double? _sidebarOpenWidth;
  double? _sidebarCompactWidth;

  /// Set all settings for the all responsive widgets.
  ///
  /// [screenChangePoints] manages the information of the different points of
  /// change of the screen.
  /// [screenMaxWidth] allow set the maximum width of the responsive widgets.
  void setCustomSettings({
    final ScreenChangePoints? screenChangePoints,
    final double? screenMaxWidth,
  }) {
    assert(screenMaxWidth == null || screenMaxWidth > 0);
    if (screenChangePoints != null) _screeChangePoints = screenChangePoints;
    _screenMaxWidth = screenMaxWidth;
  }

  /// Returns the maximum width for all responsive widgets.
  double? get screenMaxWidth => _screenMaxWidth;

  /// Width of the sidebar when is open.
  double get sidebarOpenWidth => _sidebarOpenWidth ?? 300.0;

  /// Width of the sidebar when is compact.
  double get sidebarCompactWidth => _sidebarCompactWidth ?? 50.0;

  /// Returns change points information.
  ScreenChangePoints get screenChangePoints => _screeChangePoints;

  static ResponsiveSettings? _instance;

  /// Returns a instance of the [ResponsiveSettings] class.
  // ignore: prefer_constructors_over_static_methods
  static ResponsiveSettings get instance {
    return _instance ??= ResponsiveSettings._();
  }
}
