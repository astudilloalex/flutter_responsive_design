import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_design/src/responsive/responsive.dart';
import 'package:responsive_design/src/responsive/responsive_app_bar.dart';

class ResponsiveScaffold extends StatelessWidget {
  /// The color of the [Material] widget that underlies the entire Scaffold.
  final Color? backgroundColor;

  /// The primary content of the scaffold.
  final Widget? body;

  /// A bottom navigation bar to display at the bottom of the scaffold.
  final Widget? bottomNavigationBar;

  /// The persistent bottom sheet to display.
  ///
  /// A persistent bottom sheet shows information that supplements the primary
  /// content of the app. A persistent bottom sheet remains visible even when
  /// the user interacts with other parts of the app.
  final Widget? bottomSheet;

  /// Controls the maximum width of the scaffold content.
  final double? contentMaxWidth;

  /// A panel displayed to the side of the [body], often hidden on mobile
  /// devices.
  final Widget? drawer;

  /// {@macro flutter.material.DrawerController.dragStartBehavior}
  final DragStartBehavior drawerDragStartBehavior;

  /// The width of the area within which a horizontal swipe will open the
  /// drawer.
  final double? drawerEdgeDragWidth;

  /// Determines if the [Scaffold.drawer] can be opened with a drag
  /// gesture.
  ///
  /// By default, the drag gesture is enabled.
  final bool drawerEnableOpenDragGesture;

  /// The color to use for the scrim that obscures primary content while a drawer is open.
  ///
  /// By default, the color is [Colors.black54]
  final Color? drawerScrimColor;

  /// A panel displayed to the side of the [body], often hidden on mobile
  /// devices. Swipes in from right-to-left ([TextDirection.ltr]) or
  /// left-to-right ([TextDirection.rtl])
  final Widget? endDrawer;

  /// Determines if the [Scaffold.endDrawer] can be opened with a
  /// drag gesture.
  final bool endDrawerEnableOpenDragGesture;

  /// If true, and [bottomNavigationBar] or [persistentFooterButtons]
  /// is specified, then the [body] extends to the bottom of the Scaffold,
  /// instead of only extending to the top of the [bottomNavigationBar]
  /// or the [persistentFooterButtons].
  final bool extendBody;

  /// If true, and an [appBar] is specified, then the height of the [body] is
  /// extended to include the height of the app bar and the top of the body
  /// is aligned with the top of the app bar.
  final bool extendBodyBehindAppBar;

  /// A button displayed floating above [body], in the bottom right corner.
  final Widget? floatingActionButton;

  /// Animator to move the [floatingActionButton] to a new [floatingActionButtonLocation].
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  /// Responsible for determining where the [floatingActionButton] should go.
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  final Gradient? gradientBackground;

  /// Optional callback that is called when the [Scaffold.drawer] is opened or closed.
  final DrawerCallback? onDrawerChanged;

  /// Optional callback that is called when the [Scaffold.endDrawer] is opened or closed.
  final DrawerCallback? onEndDrawerChanged;

  /// A set of buttons that are displayed at the bottom of the scaffold.
  /// ///
  /// Typically this is a list of [TextButton] widgets. These buttons are
  /// persistently visible, even if the [body] of the scaffold scrolls.
  ///
  /// These widgets will be wrapped in an [OverflowBar].
  ///
  /// The [persistentFooterButtons] are rendered above the
  /// [bottomNavigationBar] but below the [body].
  final List<Widget>? persistentFooterButtons;

  /// Whether this scaffold is being displayed at the top of the screen.
  final bool primary;

  /// If true the [body] and the scaffold's floating widgets should size
  /// themselves to avoid the onscreen keyboard whose height is defined by the
  /// ambient [MediaQuery]'s [MediaQueryData.viewInsets] `bottom` property.
  final bool? resizeToAvoidBottomInset;

  /// An app bar to display at the top of the scaffold.
  final ResponsiveAppBar? responsiveAppBar;

  /// Restoration ID to save and restore the state of the [Scaffold].
  final String? restorationId;

  /// Controls whether the drawer should display on large screens.
  final bool showDrawerInLargeScreen;

  /// Controls whether the drawer should display on medium screens.
  final bool showDrawerInMediumScreen;

  const ResponsiveScaffold({
    Key? key,
    this.backgroundColor,
    this.body,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.contentMaxWidth,
    this.drawer,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.drawerScrimColor,
    this.endDrawer,
    this.endDrawerEnableOpenDragGesture = true,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.floatingActionButton,
    this.floatingActionButtonAnimator,
    this.floatingActionButtonLocation,
    this.gradientBackground,
    this.onDrawerChanged,
    this.onEndDrawerChanged,
    this.persistentFooterButtons,
    this.primary = true,
    this.resizeToAvoidBottomInset,
    this.responsiveAppBar,
    this.restorationId,
    this.showDrawerInLargeScreen = false,
    this.showDrawerInMediumScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      smallScreen: Scaffold(
        appBar: responsiveAppBar,
        backgroundColor: gradientBackground == null ? backgroundColor : null,
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: gradientBackground,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth:
                      contentMaxWidth ?? MediaQuery.of(context).size.width,
                ),
                child: body,
              ),
            ),
          ),
        ),
        bottomNavigationBar: bottomNavigationBar,
        bottomSheet: bottomSheet,
        drawer: drawer,
        drawerDragStartBehavior: drawerDragStartBehavior,
        drawerEdgeDragWidth: drawerEdgeDragWidth,
        drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
        drawerScrimColor: drawerScrimColor,
        endDrawer: endDrawer,
        endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
        extendBody: extendBody,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonAnimator: floatingActionButtonAnimator,
        floatingActionButtonLocation: floatingActionButtonLocation,
        onDrawerChanged: onDrawerChanged,
        onEndDrawerChanged: onDrawerChanged,
        persistentFooterButtons: persistentFooterButtons,
        primary: primary,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        restorationId: restorationId,
      ),
      mediumScreen: Scaffold(
        appBar: responsiveAppBar,
        backgroundColor: gradientBackground == null ? backgroundColor : null,
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: gradientBackground,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth:
                      contentMaxWidth ?? MediaQuery.of(context).size.width,
                ),
                child: body,
              ),
            ),
          ),
        ),
        bottomNavigationBar: bottomNavigationBar,
        bottomSheet: bottomSheet,
        drawer: showDrawerInMediumScreen ? drawer : null,
        drawerDragStartBehavior: drawerDragStartBehavior,
        drawerEdgeDragWidth: drawerEdgeDragWidth,
        drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
        drawerScrimColor: drawerScrimColor,
        endDrawer: showDrawerInMediumScreen ? endDrawer : null,
        endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
        extendBody: extendBody,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonAnimator: floatingActionButtonAnimator,
        floatingActionButtonLocation: floatingActionButtonLocation,
        onDrawerChanged: onDrawerChanged,
        onEndDrawerChanged: onDrawerChanged,
        persistentFooterButtons: persistentFooterButtons,
        primary: primary,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        restorationId: restorationId,
      ),
      largeScreen: Scaffold(
        appBar: responsiveAppBar,
        backgroundColor: gradientBackground == null ? backgroundColor : null,
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: gradientBackground,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth:
                      contentMaxWidth ?? MediaQuery.of(context).size.width,
                ),
                child: body,
              ),
            ),
          ),
        ),
        bottomNavigationBar: bottomNavigationBar,
        bottomSheet: bottomSheet,
        drawer: showDrawerInLargeScreen ? drawer : null,
        drawerDragStartBehavior: drawerDragStartBehavior,
        drawerEdgeDragWidth: drawerEdgeDragWidth,
        drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
        drawerScrimColor: drawerScrimColor,
        endDrawer: showDrawerInLargeScreen ? endDrawer : null,
        endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
        extendBody: extendBody,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonAnimator: floatingActionButtonAnimator,
        floatingActionButtonLocation: floatingActionButtonLocation,
        onDrawerChanged: onDrawerChanged,
        onEndDrawerChanged: onDrawerChanged,
        persistentFooterButtons: persistentFooterButtons,
        primary: primary,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        restorationId: restorationId,
      ),
    );
  }
}
