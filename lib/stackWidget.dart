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
      title: "Stack Widget",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Stack Widget"),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                color: Color.fromARGB(255, 1, 131, 6),
              ),
              Container(
                width: 140,
                height: 140,
                color: Colors.white,
              ),
              Container(
                width: 80,
                height: 80,
                color: Color.fromARGB(255, 197, 120, 5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}