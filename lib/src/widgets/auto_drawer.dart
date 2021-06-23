import 'package:flutter/material.dart';

class AutoDrawer extends StatelessWidget {
  final List<Widget>? children;

  AutoDrawer({this.children});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Container(),
            ),
            ...?children,
          ],
        ),
      ),
    );
  }
}
