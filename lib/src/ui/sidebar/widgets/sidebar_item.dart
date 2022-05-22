import 'package:flutter/material.dart';
import 'package:responsive_design/responsive_design.dart';

class SidebarItem extends StatelessWidget {
  const SidebarItem({
    Key? key,
    required this.icon,
    this.onTap,
    this.title,
  }) : super(key: key);

  /// Icon to show leading of the sidebar.
  final Widget icon;

  /// Called when the user taps this part of the material.
  final GestureTapCallback? onTap;

  /// The title of the sidebar item.
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
    );
  }
}
