import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int season = 0;

  final List<String> seasons = [
    'Summer',
    'Rainy',
    'Winter',
  ];

  final List<IconData> icons = [
    Icons.wb_sunny,
    Icons.water_drop,
    Icons.ac_unit,
  ];

  final List<Color> colors = [
    Colors.orange,
    Colors.blue,
    Colors.indigo,
  ];

  void changeSeason(bool value) {
    setState(() {
      season = (season + 1) % 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: colors[season],
        ),
      ),

      home: Scaffold(
        appBar: AppBar(
          title: Text('${seasons[season]} Theme'),
          backgroundColor: colors[season],
          foregroundColor: Colors.white,
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Icon(
                icons[season],
                size: 80,
                color: colors[season],
              ),

              const SizedBox(height: 20),

              Text(
                seasons[season],
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: colors[season],
                ),
              ),

              const SizedBox(height: 30),

              Switch(
                value: season != 0,
                onChanged: changeSeason,
              ),

              const SizedBox(height: 10),

              const Text(
                'Switch to change season',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}