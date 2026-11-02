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
      title: 'Navigation with Named Routes',
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstRoute(),
        '/second': (context) => const SecondRoute(),
        '/third': (context) => const ThirdRoute(),
      },
    );
  }
}

// -------------------- First Route --------------------

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
        backgroundColor: Color.fromARGB(255, 215, 191, 38),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to Second Route
            Navigator.pushNamed(context, '/second');
          },
          child: const Text('Go to Second Route'),
        ),
      ),
    );
  }
}

// -------------------- Second Route --------------------

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to Third Route
            Navigator.pushNamed(context, '/third');
          },
          child: const Text('Go to Third Route'),
        ),
      ),
    );
  }
}

// -------------------- Third Route --------------------

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Route'),
        backgroundColor: Color.fromARGB(255, 187, 21, 40),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Return directly to First Route
            Navigator.popUntil(
              context,
              ModalRoute.withName('/'),
            );
          },
          child: const Text('Go Back to First Route'),
        ),
      ),
    );
  }
}