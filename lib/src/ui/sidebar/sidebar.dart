import 'package:flutter/material.dart';
import 'package:responsive_design/responsive_design.dart';
import 'package:responsive_design/src/domain/enums/sidebar_mode.dart';

/// A left sidebar of the Scaffold.
class Sidebar extends StatelessWidget {
  /// Define a [Sidebar] widget.
  const Sidebar({
    Key? key,
    this.asDrawer = false,
    this.footer,
    this.header,
    this.items = const [],
    this.mode = SidebarMode.auto,
  }) : super(key: key);

  /// Only apply when use in a [ResponsiveScaffold], drawer is null and [mode]
  /// is [SidebarMode.auto], if true transform the sidebar in a drawer.
  final bool asDrawer;

  /// Apply a footer widget in the sidebar.
  final Widget? footer;

  /// Apply a header widget.
  final Widget? header;

  /// Items off the sidebar.
  final List<Widget> items;

  /// Mode of the sidebar.
  ///
  /// Default [SidebarMode.auto].
  final SidebarMode mode;

  @override
  Widget build(BuildContext context) {
    final ResponsiveType type = ResponsiveUtil(
      changePoints: ResponsiveSettings.instance.screenChangePoints,
      context: context,
    ).responsiveType;
    final double openWidth = ResponsiveSettings.instance.sidebarOpenWidth;
    final double compactWidth = ResponsiveSettings.instance.sidebarCompactWidth;
    SidebarMode mode = this.mode;
    if (this.mode == SidebarMode.auto) {
      if (type == ResponsiveType.desktop) mode = SidebarMode.open;
      if (type == ResponsiveType.tablet) mode = SidebarMode.compact;
    }
    if (this.mode == SidebarMode.auto &&
            asDrawer &&
            type == ResponsiveType.phone ||
        type == ResponsiveType.watch) {
      return Drawer(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          child: Column(
            children: [
              if (header != null) header!,
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (_, index) {
                    return items[index];
                  },
                ),
              ),
              if (footer != null) footer!,
            ],
          ),
        ),
      );
    }
    return Card(
      elevation: 0.0,
      shape: const RoundedRectangleBorder(),
      margin: EdgeInsets.zero,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: mode == SidebarMode.open ? openWidth : compactWidth,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            if (header != null) header!,
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (_, index) {
                  return items[index];
                },
              ),
            ),
            if (footer != null) footer!,
          ],
        ),
      ),
    );
  }
}
