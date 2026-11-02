import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen size and orientation
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    double width = screenSize.width;

    // Determine view type based on width
    String viewType;

    if (width < 600) {
      viewType = 'Mobile View';
    } else if (width < 1024) {
      viewType = 'Tablet View';
    } else {
      viewType = 'Desktop View';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MediaQuery + Breakpoints',
        ),
      ),
      body: Container(
        color: Colors.purple,
        child: Center(
          child: Text(
            'Responsive Layout Example\n\n'
            'View Type: $viewType\n'
            'Screen Width: ${width.toStringAsFixed(2)}\n'
            'Screen Height: ${screenSize.height.toStringAsFixed(2)}\n'
            'Orientation: $orientation',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}