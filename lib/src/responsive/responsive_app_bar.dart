import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_design/src/responsive/responsive.dart';
import 'package:responsive_design/src/widgets/app_bar_action.dart';

/// An AppBar that adapts to different screen densities.
class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// A list of AppBarAction to display in a row after the [title] widget.
  final List<AppBarAction>? actions;

  /// The color, opacity, and size to use for the icons that appear in the app
  /// bar's [actions].
  final IconThemeData? actionsIconTheme;

  /// The fill color to use for an app bar's [Material].
  final Color? backgroundColor;

  /// If true, preserves the original defaults for the [backgroundColor],
  /// [iconTheme], [actionsIconTheme] properties, and the original use of
  /// the [textTheme] and [brightness] properties.
  final bool? backwardsCompatibility;

  /// This widget appears across the bottom of the app bar.
  final PreferredSizeWidget? bottom;

  /// How opaque the bottom part of the app bar is.
  final double bottomOpacity;

  /// Whether the title should be centered.
  final bool? centerTitle;

  /// This property controls the size of the shadow below the app bar.
  final double? elevation;

  /// Whether the title should be wrapped with header [Semantics].
  final bool excludeHeaderSemantics;

  /// This widget is stacked behind the toolbar and the tab bar. Its height will
  /// be the same as the app bar's overall height.
  final Widget? flexibleSpace;

  /// The default color for [Text] and [Icon]s within the app bar.
  final Color? foregroundColor;

  /// The color, opacity, and size to use for toolbar icons.
  final IconThemeData? iconTheme;

  /// Defines the width of [leading] widget.
  final double? leadingWidth;

  /// A size whose height is the sum of [toolbarHeight] and the [bottom] widget's
  /// preferred height.
  @override
  final Size preferredSize;

  /// Whether this app bar is being displayed at the top of the screen.
  final bool primary;

  /// The of the shadow below the app bar.
  final Color? shadowColor;

  /// The shape of the app bar's material's shape as well as its shadow.
  final ShapeBorder? shape;

  /// Specifies the style to use for the system overlays that overlap the AppBar.
  final SystemUiOverlayStyle? systemOverlayStyle;

  /// The typographic styles to use for text in the app bar. Typically this is
  /// set along with [brightness] [backgroundColor], [iconTheme].
  final TextTheme? textTheme;

  /// The primary widget displayed in the app bar.
  final Widget? title;

  /// The spacing around [title] content on the horizontal axis. This spacing is
  /// applied even if there is no [leading] content or [actions]. If you want
  /// [title] to take all the space available, set this value to 0.0.
  final double? titleSpacing;

  /// The default text style for the AppBar's [title] widget.
  final TextStyle? titleTextStyle;

  /// Defines the height of the toolbar component of an [AppBar].
  final double? toolbarHeight;

  /// How opaque the toolbar part of the app bar is.
  final double toolbarOpacity;

  /// The default text style for the AppBar's [leading], and
  /// [actions] widgets, but not its [title].
  final TextStyle? toolbarTextStyle;

  ResponsiveAppBar({
    this.actions,
    this.actionsIconTheme,
    this.backgroundColor,
    this.backwardsCompatibility,
    this.bottom,
    this.bottomOpacity = 1.0,
    this.centerTitle,
    this.elevation,
    this.excludeHeaderSemantics = false,
    this.flexibleSpace,
    this.foregroundColor,
    this.iconTheme,
    this.leadingWidth,
    this.primary = true,
    this.shadowColor,
    this.shape,
    this.systemOverlayStyle,
    this.textTheme,
    this.title,
    this.titleSpacing,
    this.titleTextStyle,
    this.toolbarHeight,
    this.toolbarOpacity = 1.0,
    this.toolbarTextStyle,
  }) : preferredSize = Size.fromHeight(toolbarHeight ??
            kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));

  @override
  Widget build(BuildContext context) {
    final bool smallScreen = Responsive.isSmallScreen(context);
    final bool mediumScreen = Responsive.isMediumScreen(context);
    return AppBar(
      actions: smallScreen
          ? _smallScreenActions
          : mediumScreen
              ? _mediumScreenActions
              : actions,
      actionsIconTheme: actionsIconTheme,
      backgroundColor: backgroundColor,
      backwardsCompatibility: backwardsCompatibility,
      bottom: bottom,
      bottomOpacity: bottomOpacity,
      centerTitle: centerTitle,
      elevation: elevation,
      excludeHeaderSemantics: excludeHeaderSemantics,
      flexibleSpace: flexibleSpace,
      foregroundColor: foregroundColor,
      iconTheme: iconTheme,
      leadingWidth: leadingWidth,
      primary: primary,
      shadowColor: shadowColor,
      shape: shape,
      systemOverlayStyle: systemOverlayStyle,
      textTheme: textTheme,
      title: title,
      titleSpacing: titleSpacing,
      titleTextStyle: titleTextStyle,
      toolbarOpacity: toolbarOpacity,
      toolbarTextStyle: toolbarTextStyle,
    );
  }

  List<Widget>? get _smallScreenActions {
    return [...?actions?.where((act) => act.showInSmallScreen)];
  }

  List<Widget>? get _mediumScreenActions {
    return [...?actions?.where((act) => act.showInMediumScreen)];
  }
}
