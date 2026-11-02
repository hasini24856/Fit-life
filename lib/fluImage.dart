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
      title: "Network Image Demo",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Image Widget"),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Image.network(
            'https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2017/04/epic-waterfalls-cover.jpg',
            width: 300,
            height: 300,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return const CircularProgressIndicator();
            },
            errorBuilder: (context, error, stackTrace) {
              return const Text(
                "Failed to load image",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 57, 54, 244),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}