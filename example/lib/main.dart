import 'package:flutter/material.dart';
import 'package:responsive_design/responsive_design.dart';

/// Main Method
void main() {
  runApp(MyApp());
}

/// StatelessWidget to show an example
class MyApp extends StatelessWidget {
  /// Override build method with responsive scaffold widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveScaffold(
        responsiveAppBar: ResponsiveAppBar(
          actions: [
            AppBarAction(
              showInSmallScreen: true,
              showInMediumScreen: false,
              child: InkWell(
                onTap: () {},
                child: Text('Hola Mundo'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
