# responsive_design

Create responsive applications using different widgets that adapt to different screen densities.

## Getting Started
[![pub package](https://pub.dev/static/img/pub-dev-logo-2x.png?hash=umitaheu8hl7gd3mineshk2koqfngugi)](https://pub.dev/packages/responsive_design)

### **Add your own settings**
Manage the responsive screen settings with `ResponsiveSettings` class.
```dart
const ResponsiveSettings settings = ResponsiveSettings(
  desktopChangePoint: 1150.0, // Default 1200.0
  tabletChangePoint: 625.0,   // Default 600.0
  watchChangePoint: 250.0,    // Default 300.0
);
```
### **Use the responsive widget**
The responsive widget allows you to have different layouts for each device.
```dart
const ResponsiveWidget(
  // Optional parameter, if you don't set, default values will be applied.
  responsiveSettings: settings,
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
```
### **Use only responsive app bar**
The responsive app bar allows to adapt the top tool bar to all screens.
```dart
const Scaffold(
  appBar: ResponsiveAppBar(
    // Optional parameter, if you don't set, default values will be applied.
    responsiveSettings: settings,
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
```