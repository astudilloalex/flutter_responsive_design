import 'package:example/src/sidebar_example.dart';
import 'package:flutter/material.dart';
import 'package:responsive_design/responsive_design.dart';

/// Main function.
void main() {
  // Global Settings
  ResponsiveSettings.instance.setCustomSettings(
    screenChangePoints: const ScreenChangePoints(
      desktopChangePoint: 1150.0,
      tabletChangePoint: 625.0,
      watchChangePoint: 250.0,
    ),
  );
  runApp(const MyApp());
}

/// Root of the application.
class MyApp extends StatelessWidget {
  /// Define a [MyApp] widget.
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Design Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueGrey,
        ),
      ),
      routes: {
        '/': (_) => const HomePage(),
        '/responsive-app-bar': (_) => const ResponsiveAppBarExample(),
        '/responsive-widget': (_) => const ResponsiveWidgetExample(),
        '/sidebar-widget': (_) => const SidebarExample(),
      },
      initialRoute: '/',
    );
  }
}

/// Home page of the app.
class HomePage extends StatelessWidget {
  /// Define a [HomePage] widget.
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              onTap: () => Navigator.of(context).pushNamed(
                '/responsive-app-bar',
              ),
              title: const Text('Responsive App Bar'),
            ),
            ListTile(
              onTap: () => Navigator.of(context).pushNamed(
                '/responsive-widget',
              ),
              title: const Text('Responsive Widget'),
            ),
            ListTile(
              onTap: () => Navigator.of(context).pushNamed(
                '/sidebar-widget',
              ),
              title: const Text('Sidebar Widget'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Example of a responsive app bar.
class ResponsiveAppBarExample extends StatelessWidget {
  /// Define a [ResponsiveAppBarExample] widget.
  const ResponsiveAppBarExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ResponsiveAppBar(
        screenChangePoints: ScreenChangePoints(),
        title: Text('Responsive app bar'),
        actions: [
          AppBarAction(
            Center(child: Text('About')),
          ),
          AppBarAction(
            SizedBox(width: 16.0),
            showInAllScreens: true,
          ),
          AppBarAction(
            Icon(Icons.brightness_auto_outlined),
            showInAllScreens: true,
          ),
          AppBarAction(
            SizedBox(width: 16.0),
            showInAllScreens: true,
          ),
        ],
      ),
    );
  }
}

/// A responsive widget with multiple design for each screen.
class ResponsiveWidgetExample extends StatelessWidget {
  /// Define a [ResponsiveWidgetExample] widget.
  const ResponsiveWidgetExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      desktop: Scaffold(
        body: Center(
          child: Text(
            'Desktop screen',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
            ),
          ),
        ),
      ),
      phone: Scaffold(
        body: Center(
          child: Text(
            'Phone screen',
            style: TextStyle(
              color: Colors.amber,
              fontSize: 25.0,
            ),
          ),
        ),
      ),
      tablet: Scaffold(
        body: Center(
          child: Text(
            'Tablet screen',
            style: TextStyle(
              color: Colors.greenAccent,
              fontSize: 25.0,
            ),
          ),
        ),
      ),
      watch: Scaffold(
        body: Center(
          child: Text(
            'Watch screen',
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 25.0,
            ),
          ),
        ),
      ),
    );
  }
}
