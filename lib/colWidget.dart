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
      title: "Column Widget",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Column Widget"),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 50,
                color: Colors.green,
              ),
              const SizedBox(height: 10),
              Container(
                width: 100,
                height: 50,
                color: Colors.yellow,
              ),
              const SizedBox(height: 10),
              Container(
                width: 100,
                height: 50,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}