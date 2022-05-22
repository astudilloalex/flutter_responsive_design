import 'package:flutter/material.dart';
import 'package:responsive_design/src/domain/entities/responsive_settings.dart';
import 'package:responsive_design/src/ui/sidebar/sidebar.dart';

/// Sidebar item to use in [Sidebar] widget.
class SidebarItem extends StatelessWidget {
  /// Define a [SidebarItem] widget.
  const SidebarItem({
    Key? key,
    this.color = Colors.transparent,
    required this.icon,
    this.onTap,
    this.selected = false,
    this.selectedColor = Colors.transparent,
    this.title,
  }) : super(key: key);

  /// Color of the sidebar item.
  final Color color;

  /// Icon to show leading of the sidebar.
  final Widget icon;

  /// Called when the user taps this part of the material.
  final GestureTapCallback? onTap;

  /// If the item is selected.
  final bool selected;

  /// The selected background color
  final Color selectedColor;

  /// The title of the sidebar item.
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: selected ? selectedColor : color,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LayoutBuilder(
            builder: (_, constraints) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  if (constraints.maxWidth >
                      ResponsiveSettings.instance.sidebarCompactWidth)
                    const SizedBox(width: 8.0),
                  if (title != null &&
                      constraints.maxWidth >
                          ResponsiveSettings.instance.sidebarCompactWidth)
                    Expanded(child: title!),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
