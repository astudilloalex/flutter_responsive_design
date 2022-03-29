import 'package:flutter/material.dart';
import 'package:responsive_design/src/domain/entities/responsive_settings.dart';
import 'package:responsive_design/src/domain/entities/screen_change_points.dart';
import 'package:responsive_design/src/domain/enums/responsive_type.dart';
import 'package:responsive_design/src/ui/app_bar/widgets/app_bar_action.dart';
import 'package:responsive_design/src/ui/utilities/responsive_util.dart';

/// An AppBar that adapts to different screen sizes.
class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Define a [ResponsiveAppBar] widget.
  const ResponsiveAppBar({
    Key? key,
    this.actions,
    this.actionSpace,
    this.automaticallyImplyLeading = true,
    this.backgroundColor,
    this.centerTitle,
    this.elevation,
    this.fitTitle = true,
    this.leading,
    this.maxWidth,
    this.screenChangePoints,
    this.title,
    this.titleTextStyle,
    this.toolbarHeight,
    this.toolbarTextStyle,
  }) : super(key: key);

  /// A list of Widgets to display in a row after the [title] widget.
  final List<AppBarAction>? actions;

  /// Space between actions.
  final double? actionSpace;

  /// Controls whether we should try to imply the leading widget if null.
  final bool automaticallyImplyLeading;

  /// The fill color to use for an app bar's [Material].
  ///
  /// If null, then the [AppBarTheme.backgroundColor] is used. If that value is also
  /// null, then [AppBar] uses the overall theme's [ColorScheme.primary].
  final Color? backgroundColor;

  /// Whether the [title] should be centered.
  final bool? centerTitle;

  /// This property controls the size of the shadow below the app bar.
  final double? elevation;

  /// Scale the title according to the available space of the container.
  ///
  /// Fit [title] as large as possible while still containing the source
  /// entirely within the target box.
  final bool fitTitle;

  /// A widget to display before the toolbar's [title].
  final Widget? leading;

  /// Controls the maximum width of the content of the app bar including
  /// the [title].
  final double? maxWidth;

  /// Change points to manage screen size.
  final ScreenChangePoints? screenChangePoints;

  /// The primary widget displayed in the app bar.
  final Widget? title;

  /// The default text style for the AppBar's [title] widget.
  final TextStyle? titleTextStyle;

  /// Defines the height of the toolbar component of an [ResponsiveAppBar].
  final double? toolbarHeight;

  /// The default text style for the AppBar's [leading], and
  /// [actions] widgets, but not its [title].
  final TextStyle? toolbarTextStyle;

  @override
  Widget build(BuildContext context) {
    final ResponsiveSettings settings = ResponsiveSettings.instance;
    final ResponsiveType type = ResponsiveUtil(
      changePoints: screenChangePoints ?? settings.changePoints,
      context: context,
    ).responsiveType;
    final List<Widget> currentActions = [];
    for (int i = 0; i < (actions?.length ?? 0); i++) {
      switch (type) {
        case ResponsiveType.desktop:
          if (actions![i].showInAllScreens || actions![i].showInDesktop) {
            if (actionSpace != null && i != 0) {
              currentActions.add(
                Padding(
                  padding: EdgeInsets.only(right: actionSpace!),
                  child: actions![i],
                ),
              );
            } else {
              currentActions.add(actions![i]);
            }
          }
          break;
        case ResponsiveType.phone:
          if (actions![i].showInAllScreens || actions![i].showInPhone) {
            if (actionSpace != null) {
              currentActions.add(
                Padding(
                  padding: EdgeInsets.only(right: actionSpace!),
                  child: actions![i],
                ),
              );
            } else {
              currentActions.add(actions![i]);
            }
          }
          break;
        case ResponsiveType.tablet:
          if (actions![i].showInAllScreens || actions![i].showInTablet) {
            if (actionSpace != null) {
              currentActions.add(
                Padding(
                  padding: EdgeInsets.only(right: actionSpace!),
                  child: actions![i].child,
                ),
              );
            } else {
              currentActions.add(actions![i].child);
            }
          }
          break;
        case ResponsiveType.watch:
          if (actions![i].showInAllScreens || actions![i].showInWatch) {
            if (actionSpace != null) {
              currentActions.add(
                Padding(
                  padding: EdgeInsets.only(right: actionSpace!),
                  child: actions![i].child,
                ),
              );
            } else {
              currentActions.add(actions![i].child);
            }
          }
          break;
      }
    }
    final double? maxWidth = this.maxWidth ?? settings.screenMaxWidth;
    if (maxWidth != null) {
      return Card(
        margin: EdgeInsets.zero,
        color: backgroundColor ??
            AppBarTheme.of(context).backgroundColor ??
            Theme.of(context).colorScheme.primary,
        elevation: elevation,
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: AppBar(
              actions: currentActions,
              automaticallyImplyLeading: automaticallyImplyLeading,
              backgroundColor: backgroundColor,
              centerTitle: centerTitle,
              elevation: 0.0,
              leading: leading,
              title: fitTitle ? FittedBox(child: title) : title,
              titleTextStyle: titleTextStyle,
              toolbarHeight: toolbarHeight,
              toolbarTextStyle: toolbarTextStyle,
            ),
          ),
        ),
      );
    }
    return AppBar(
      actions: currentActions,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      elevation: 0.0,
      leading: leading,
      title: fitTitle ? FittedBox(child: title) : title,
      titleTextStyle: titleTextStyle,
      toolbarHeight: toolbarHeight,
      toolbarTextStyle: toolbarTextStyle,
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(toolbarHeight ?? kToolbarHeight);
  }
}
