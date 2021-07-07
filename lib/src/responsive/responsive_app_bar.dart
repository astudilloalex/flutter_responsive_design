import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_design/src/common/constants.dart';
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

  /// Controls the maximum width of the content of the app bar including
  /// the [title].
  final double? contentMaxWidth;

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

  /// The empty space that surrounds the app bar.
  final EdgeInsetsGeometry margin;

  /// A size whose height is the sum of [toolbarHeight] and the [bottom] widget's
  /// preferred height.
  @override
  final Size preferredSize;

  /// Whether this app bar is being displayed at the top of the screen.
  final bool primary;

  /// The shape of the app bar [Material].
  final ShapeBorder shape;

  /// Controls whether the title is displayed on medium-sized screens.
  final bool showTitleInMediumScreen;

  /// Controls whether the title is displayed on small screens.
  final bool showTitleInSmallScreen;

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
    this.contentMaxWidth,
    this.elevation,
    this.excludeHeaderSemantics = false,
    this.flexibleSpace,
    this.foregroundColor,
    this.iconTheme,
    this.leadingWidth,
    this.margin = EdgeInsets.zero,
    this.primary = true,
    this.shape = const RoundedRectangleBorder(),
    this.showTitleInMediumScreen = true,
    this.showTitleInSmallScreen = true,
    this.systemOverlayStyle,
    this.textTheme,
    this.title,
    this.titleSpacing,
    this.titleTextStyle,
    this.toolbarHeight,
    this.toolbarOpacity = 1.0,
    this.toolbarTextStyle,
  })  : preferredSize = Size.fromHeight(toolbarHeight ??
            kToolbarHeight + (bottom?.preferredSize.height ?? 0.0)),
        assert(
          contentMaxWidth == null || contentMaxWidth >= kLargeScreenMinWidth,
          'The maximum size must be greater than or equal to $kLargeScreenMinWidth.',
        );

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      color: backgroundColor ??
          AppBarTheme.of(context).backgroundColor ??
          Theme.of(context).primaryColor,
      shape: shape,
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: contentMaxWidth ?? MediaQuery.of(context).size.width,
          ),
          child: AppBar(
            actions: _actions(context),
            actionsIconTheme: actionsIconTheme,
            backgroundColor: Colors.transparent,
            backwardsCompatibility: backwardsCompatibility,
            bottom: bottom,
            bottomOpacity: bottomOpacity,
            centerTitle: centerTitle,
            elevation: 0.0,
            excludeHeaderSemantics: excludeHeaderSemantics,
            flexibleSpace: flexibleSpace,
            foregroundColor: foregroundColor,
            iconTheme: iconTheme,
            leadingWidth: leadingWidth,
            primary: primary,
            systemOverlayStyle: systemOverlayStyle,
            textTheme: textTheme,
            title: _title(context),
            titleSpacing: titleSpacing,
            titleTextStyle: titleTextStyle,
            toolbarHeight: toolbarHeight,
            toolbarOpacity: toolbarOpacity,
            toolbarTextStyle: toolbarTextStyle,
          ),
        ),
      ),
    );
  }

  List<Widget>? _actions(BuildContext context) {
    if (Responsive.isLargeScreen(context)) return actions;
    if (Responsive.isMediumScreen(context)) {
      return [...?actions?.where((act) => act.showInMediumScreen)];
    }
    if (Responsive.isSmallScreen(context)) {
      return [...?actions?.where((act) => act.showInSmallScreen)];
    }
  }

  Widget? _title(BuildContext context) {
    if (Responsive.isLargeScreen(context)) return title;
    if (Responsive.isMediumScreen(context) && showTitleInMediumScreen) {
      return title;
    }
    if (Responsive.isSmallScreen(context) && showTitleInSmallScreen) {
      return title;
    }
  }
}
