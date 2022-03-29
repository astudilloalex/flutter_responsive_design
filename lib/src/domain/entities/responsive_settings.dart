// ignore_for_file: prefer_constructors_over_static_methods

import 'package:responsive_design/src/domain/entities/screen_change_points.dart';

/// Manage the responsive screen settings.
class ResponsiveSettings {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  ResponsiveSettings._();

  ScreenChangePoints _changePoints = const ScreenChangePoints();
  double? _screenMaxWidth;

  /// Set all settings for the all responsive widgets.
  ///
  /// [screenChangePoints] manages the information of the different points of
  /// change of the screen.
  /// [screenMaxWidth] allow set the maximum width of the responsive widgets.
  void setCustomSettings({
    final ScreenChangePoints? screenChangePoints,
    final double? screenMaxWidth,
  }) {
    if (screenChangePoints != null) _changePoints = screenChangePoints;
    _screenMaxWidth = screenMaxWidth;
  }

  /// Returns the maximum width for all responsive widgets.
  double? get screenMaxWidth => _screenMaxWidth;

  /// Returns change points information.
  ScreenChangePoints get changePoints => _changePoints;

  static ResponsiveSettings? _instance;

  /// Returns a instance of the [ResponsiveSettings] class.
  static ResponsiveSettings get instance {
    return _instance ??= ResponsiveSettings._();
  }
}
