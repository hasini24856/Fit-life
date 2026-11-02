import 'package:flutter/material.dart';
import 'login.dart';
import 'dashboard.dart';
import 'workouts.dart';
import 'profile.dart';
import 'food.dart';

void main() {
  runApp(const FitLifeApp());
}

class FitLifeApp extends StatelessWidget {
  const FitLifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FitLife',

      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        scaffoldBackgroundColor: const Color(0xfff6f8f7),
      ),

      initialRoute: '/login',

      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const FitnessHome(),
        '/dashboard': (context) => const Dashboard(),
        '/workouts': (context) => const WorkoutsScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/food': (context) => const FoodScreen(),
      },
    );
  }
}

class FitnessHome extends StatefulWidget {
  const FitnessHome({super.key});

  @override
  State<FitnessHome> createState() => _FitnessHomeState();
}

class _FitnessHomeState extends State<FitnessHome> {
  int selectedIndex = 0;

  final List<Widget> screens = const [
    Dashboard(),
    WorkoutsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FitLife',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.restaurant_menu),
            tooltip: 'Food Recommendations',
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/food',
              );
            },
          ),

          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'You are doing great today! Keep moving 💪',
                  ),
                ),
              );
            },
          ),
        ],
      ),

      body: screens[selectedIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,

        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),

          NavigationDestination(
            icon: Icon(Icons.fitness_center_outlined),
            selectedIcon: Icon(Icons.fitness_center),
            label: 'Workouts',
          ),

          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}