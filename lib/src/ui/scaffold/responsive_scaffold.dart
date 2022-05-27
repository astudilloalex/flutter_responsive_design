import 'package:flutter/material.dart';
import 'package:responsive_design/responsive_design.dart';
import 'package:responsive_design/src/domain/enums/sidebar_mode.dart';

class ResponsiveScaffold extends StatelessWidget {
  const ResponsiveScaffold({
    Key? key,
    this.appBar,
    this.body,
    this.bodyMaxWidth,
    this.bottomNavigationBar,
    this.drawer,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.onDrawerChanged,
    this.persistentFooterButtons,
    this.sidebar,
  })  : assert(bodyMaxWidth == null || bodyMaxWidth > 0.0),
        super(key: key);

  /// An app bar to display at the top of the scaffold.
  final PreferredSizeWidget? appBar;

  /// The primary content of the scaffold.
  final Widget? body;

  /// Controls the maximum width of the body content.
  final double? bodyMaxWidth;

  /// A bottom navigation bar to display at the bottom of the scaffold.
  ///
  /// Snack bars slide from underneath the bottom navigation bar while bottom
  /// sheets are stacked on top.
  ///
  /// The [bottomNavigationBar] is rendered below the [persistentFooterButtons]
  /// and the [body].
  final Widget? bottomNavigationBar;

  /// A panel displayed to the side of the [body], often hidden on mobile
  /// devices. Swipes in from either left-to-right ([TextDirection.ltr]) or
  /// right-to-left ([TextDirection.rtl])
  final Widget? drawer;

  /// A button displayed floating above [body], in the bottom right corner.
  ///
  /// Typically a [FloatingActionButton].
  final Widget? floatingActionButton;

  /// Responsible for determining where the [floatingActionButton] should go.
  ///
  /// If null, the [ScaffoldState] will use the default location, [FloatingActionButtonLocation.endFloat].
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Optional callback that is called when the [Scaffold.drawer] is opened or closed.
  final DrawerCallback? onDrawerChanged;

  /// A set of buttons that are displayed at the bottom of the scaffold.
  ///
  /// Typically this is a list of [TextButton] widgets. These buttons are
  /// persistently visible, even if the [body] of the scaffold scrolls.
  ///
  /// These widgets will be wrapped in an [OverflowBar].
  ///
  /// The [persistentFooterButtons] are rendered above the
  /// [bottomNavigationBar] but below the [body].
  final List<Widget>? persistentFooterButtons;

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
            bottomNavigationBar: bottomNavigationBar,
            floatingActionButton: floatingActionButton,
            floatingActionButtonLocation: floatingActionButtonLocation,
            onDrawerChanged: onDrawerChanged,
            persistentFooterButtons: persistentFooterButtons,
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
              bottomNavigationBar: bottomNavigationBar,
              floatingActionButton: floatingActionButton,
              floatingActionButtonLocation: floatingActionButtonLocation,
              onDrawerChanged: onDrawerChanged,
              persistentFooterButtons: persistentFooterButtons,
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
      bottomNavigationBar: bottomNavigationBar,
      drawer: drawer,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      onDrawerChanged: onDrawerChanged,
      persistentFooterButtons: persistentFooterButtons,
    );
  }
}
