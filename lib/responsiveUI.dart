import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResponsivePage(),
    );
  }
}
class ResponsivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Responsive UI'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            // Small screen: center Column layout
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  myBox('Red Box', Colors.red),
                  myBox('Green Box', Colors.green),
                  myBox('Blue Box', Colors.blue),
                ],
              ),
            );
          } else {
            // Large screen: center Row layout
            return Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  myBox('Red Box', Colors.red),
                  myBox('Green Box', Colors.green),
                  myBox('Blue Box', Colors.blue),
                ],
              ),
            );
          }
        },
      ),
    );
  }
  Widget myBox(String text, Color color) {
    return Container(
      height: 150,
      width: 150,
      margin: EdgeInsets.all(10),
      color: color,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}