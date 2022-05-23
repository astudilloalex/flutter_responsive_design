import 'package:flutter/material.dart';
import 'package:responsive_design/responsive_design.dart';
import 'package:responsive_design/src/domain/enums/sidebar_mode.dart';

class ResponsiveScaffold extends StatelessWidget {
  const ResponsiveScaffold({
    Key? key,
    this.appBar,
    this.body,
    this.bodyMaxWidth,
    this.drawer,
    this.onDrawerChanged,
    this.sidebar,
  })  : assert(bodyMaxWidth == null || bodyMaxWidth > 0.0),
        super(key: key);

  /// An app bar to display at the top of the scaffold.
  final PreferredSizeWidget? appBar;

  /// The primary content of the scaffold.
  final Widget? body;

  /// Controls the maximum width of the body content.
  final double? bodyMaxWidth;

  /// A panel displayed to the side of the [body], often hidden on mobile
  /// devices. Swipes in from either left-to-right ([TextDirection.ltr]) or
  /// right-to-left ([TextDirection.rtl])
  final Widget? drawer;

  /// Optional callback that is called when the [Scaffold.drawer] is opened or closed.
  final DrawerCallback? onDrawerChanged;

  /// Add left sidebar in the scaffold, only work if [drawer] is null.
  final Widget? sidebar;

  @override
  Widget build(BuildContext context) {
    final ResponsiveSettings settings = ResponsiveSettings.instance;
    final ResponsiveType type = ResponsiveUtil(
      changePoints: settings.screenChangePoints,
      context: context,
    ).responsiveType;
    final double? maxWidth = bodyMaxWidth ?? settings.screenMaxWidth;
    if (drawer == null && sidebar != null) {
      if (sidebar is Sidebar &&
          (sidebar as Sidebar?)!.mode == SidebarMode.auto &&
          (sidebar as Sidebar?)!.asDrawer) {
        if (type == ResponsiveType.phone || type == ResponsiveType.watch) {
          return Scaffold(
            appBar: appBar,
            drawer: sidebar,
            body: body,
            onDrawerChanged: onDrawerChanged,
          );
        }
      }
      return Row(
        children: [
          sidebar!,
          Expanded(
            child: Scaffold(
              appBar: appBar,
              body: maxWidth == null
                  ? body
                  : Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: maxWidth),
                        child: body,
                      ),
                    ),
              onDrawerChanged: onDrawerChanged,
            ),
          ),
        ],
      );
    }
    return Scaffold(
      appBar: appBar,
      body: maxWidth == null
          ? body
          : Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: body,
              ),
            ),
      drawer: drawer,
      onDrawerChanged: onDrawerChanged,
    );
  }
}
