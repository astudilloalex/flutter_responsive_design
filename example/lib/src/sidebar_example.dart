import 'package:flutter/material.dart';
import 'package:responsive_design/responsive_design.dart';

class SidebarExample extends StatelessWidget {
  const SidebarExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      appBar: AppBar(),
      sidebar: Sidebar(
        asDrawer: true,
        items: [
          SidebarItem(
            icon: const Icon(Icons.home_outlined),
            onTap: () {},
            title: const Text('Hi'),
          )
        ],
      ),
    );
  }
}
