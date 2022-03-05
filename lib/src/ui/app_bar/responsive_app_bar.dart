import 'package:flutter/material.dart';
import 'package:responsive_design/src/domain/entities/responsive_settings.dart';
import 'package:responsive_design/src/domain/enums/responsive_type.dart';
import 'package:responsive_design/src/ui/app_bar/widgets/app_bar_action.dart';

/// An AppBar that adapts to different screen sizes.
class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Define a [ResponsiveAppBar] widget.
  const ResponsiveAppBar({
    Key? key,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.backgroundColor,
    this.centerTitle,
    this.elevation,
    this.fitTitle = true,
    this.leading,
    this.maxWidth,
    this.responsiveSettings = const ResponsiveSettings(),
    this.title,
    this.titleTextStyle,
    this.toolbarHeight,
    this.toolbarTextStyle,
  }) : super(key: key);

  /// A list of Widgets to display in a row after the [title] widget.
  final List<AppBarAction>? actions;

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

  /// Responsive settings to manage the with of the screen.
  final ResponsiveSettings responsiveSettings;

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
    final ResponsiveType type = responsiveSettings.responsiveType(context);
    final List<Widget> currentActions = [];
    for (int i = 0; i < (actions?.length ?? 0); i++) {
      switch (type) {
        case ResponsiveType.desktop:
          if (actions![i].showInAllScreens || actions![i].showInDesktop) {
            currentActions.add(actions![i].child);
          }
          break;
        case ResponsiveType.phone:
          if (actions![i].showInAllScreens || actions![i].showInPhone) {
            currentActions.add(actions![i].child);
          }
          break;
        case ResponsiveType.tablet:
          if (actions![i].showInAllScreens || actions![i].showInTablet) {
            currentActions.add(actions![i].child);
          }
          break;
        case ResponsiveType.watch:
          if (actions![i].showInAllScreens || actions![i].showInWatch) {
            currentActions.add(actions![i].child);
          }
          break;
      }
    }
    if (maxWidth != null) {
      return Card(
        margin: EdgeInsets.zero,
        color: backgroundColor ??
            AppBarTheme.of(context).backgroundColor ??
            Theme.of(context).colorScheme.primary,
        elevation: elevation,
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth!),
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
