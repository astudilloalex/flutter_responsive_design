# responsive_design

Create responsive applications using different widgets that adapt to different screen sizes.

## Getting Started
[![pub package](https://pub.dev/static/img/pub-dev-logo-2x.png?hash=umitaheu8hl7gd3mineshk2koqfngugi)](https://pub.dev/packages/responsive_design)

Add dependency on your pubspec.yaml file
```yaml
dependencies:
  responsive_design:
```

## **Important!**
Since version `0.1.0` the `ResponsiveSettings` class is no longer used to manage change points.
Instead use `ScreenChangePoints`, check example for more details.

### **Add your own settings**
Manage global the responsive screen change points with `ResponsiveSettings` class.
```dart
void main() {
  // Global Settings
  ResponsiveSettings.instance.changePoints = const ScreenChangePoints(
    desktopChangePoint: 1150.0,
    tabletChangePoint: 625.0,
    watchChangePoint: 250.0,
  );
  runApp(const MyApp());
}
```
### **Use the responsive widget**
The responsive widget allows you to have different layouts for each device.
```dart
const ResponsiveWidget(  
  // If don't set the global values will be applied, if do not exist global values,
  // the default values will be applied.
  screenChangePoints: ScreenChangePoints(),
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
![Responsive Widget](example/assets/images/responsive-widget.gif)

### **Use only responsive app bar**
The responsive app bar allows to adapt the top tool bar to all screens.
```dart
const Scaffold(
  appBar: ResponsiveAppBar(
    // If don't set the global values will be applied, if do not exist global values,
    // the default values will be applied.
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
```
![Responsive Widget](example/assets/images/responsive-app-bar.gif)