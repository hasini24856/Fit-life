import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Row Widget",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Row Widget"),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 70,
                height: 70,
                color: Color.fromARGB(255, 108, 17, 124),
              ),
              Container(
                width: 70,
                height: 70,
                color: Colors.indigo,
              ),
              Container(
                width: 70,
                height: 70,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}