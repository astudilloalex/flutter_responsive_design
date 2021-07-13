import 'package:flutter/material.dart';
import 'package:responsive_design/responsive_design.dart';

// Main Method
void main() {
  runApp(MyApp());
}

// StatelessWidget to show an example
class MyApp extends StatelessWidget {
  // This number indicates which example to show, change the number and
  // you will see the example according to the number.
  final int example = 1;

  @override
  Widget build(BuildContext context) {
    switch (example) {
      case 1:
        return ExampleOne();
      case 2:
        return ExampleTwo();
      default:
        return ExampleOne();
    }
  }
}

// This example uses responsive widgets, you only have to design once and
// indicate if it should be displayed on small and medium screens.
class ExampleOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveScaffold(
        backgroundColor: Colors.red,
        gradientBackground: LinearGradient(colors: [
          Colors.amber,
          Colors.blue,
          Colors.teal,
        ]),
        contentMaxWidth: 1000.0,
        showDrawerInMediumScreen: true,
        responsiveAppBar: ResponsiveAppBar(
          title: Text('Example One'),
          actions: [
            AppBarAction(
              child: Center(
                child: InkWell(
                  onTap: () {},
                  child: Text('Hello!'),
                ),
              ),
            ),
            AppBarAction(
              child: Center(
                child: InkWell(
                  onTap: () {},
                  child: Text('World!'),
                ),
              ),
            ),
          ],
        ),
        body: Card(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [Text('Welcome')],
          ),
        ),
      ),
    );
  }
}

// In this example we use different widgets to display according to screen size.
// 3 different graphical interfaces must be designed for each screen size.
// It is useful when you require different designs for each device.
class ExampleTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Responsive(
        smallScreen: _SmallScreenWidget(),
        mediumScreen: _MediumScreenWidget(),
        largeScreen: _LargeScreenWidget(),
      ),
    );
  }
}

// This widget is shown when the screen is small.
// Used in ExampleTwo
class _SmallScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Two Small Screen'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(child: Text('Responsive')),
            Divider(),
            InkWell(
              onTap: () {},
              child: Text('Drawer item'),
            ),
          ],
        ),
      ),
      body: Center(
        child:
            Text('The screen size is less or equal than $kSmallScreenMaxWidth'),
      ),
    );
  }
}

// This widget is shown when the screen is medium.
// Used in ExampleTwo
class _MediumScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Two Medium Screen'),
      ),
      body: Center(
        child: Text(
          'Screen size> $kSmallScreenMaxWidth && Screen size<$kLargeScreenMinWidth',
        ),
      ),
    );
  }
}

// This widget is shown when the screen is large.
// Used in ExampleTwo
class _LargeScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'The screen size is equal to or greater than $kLargeScreenMinWidth',
        ),
      ),
      appBar: AppBar(
        title: Text('Example Two Large Screen'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Text('Action'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
