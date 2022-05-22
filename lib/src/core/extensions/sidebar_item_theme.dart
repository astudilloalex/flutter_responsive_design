import 'package:flutter/material.dart';

class SidebarItemTheme extends ThemeExtension<SidebarItemTheme> {
  const SidebarItemTheme({
    this.selectedBackgroundColor = Colors.transparent,
  });

  final Color selectedBackgroundColor;

  @override
  ThemeExtension<SidebarItemTheme> copyWith({
    final Color? selectedBackgroundColor,
  }) {
    return SidebarItemTheme(
      selectedBackgroundColor:
          selectedBackgroundColor ?? this.selectedBackgroundColor,
    );
  }

  @override
  ThemeExtension<SidebarItemTheme> lerp(
    final ThemeExtension<SidebarItemTheme>? other,
    final double t,
  ) {
    if (other is! SidebarItemTheme) {
      return this;
    }
    return SidebarItemTheme(
      selectedBackgroundColor: Color.lerp(
        selectedBackgroundColor,
        other.selectedBackgroundColor,
        t,
      )!,
    );
  }
}
