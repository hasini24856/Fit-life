import 'package:flutter/material.dart';

class FitnessData {
  // =========================
  // USER INFORMATION
  // =========================

  static String userName = 'Sahasra';
  static String email = 'sahasra@example.com';

  static int age = 20;
  static double height = 165;
  static double weight = 55;

  static String fitnessGoal = 'Stay Fit';
  static String fitnessLevel = 'Intermediate';

  // =========================
  // TODAY'S TRACKING
  // =========================

  static int steps = 6840;
  static int calories = 320;
  static double distance = 4.5;

  static double water = 1.8;
  static double waterGoal = 2.5;

  static double sleep = 7.2;
  static double sleepGoal = 8.0;

  static int todayWorkoutMinutes = 65;

  static const int stepGoal = 10000;

  // =========================
  // STREAK
  // =========================

  static int fitnessStreak = 12;

  // =========================
  // MONTHLY PROGRESS
  // =========================

  static int previousMonthSteps = 142000;
  static int currentMonthSteps = 168500;

  static int previousMonthCalories = 7200;
  static int currentMonthCalories = 8450;

  static int previousMonthWorkoutMinutes = 620;
  static int currentMonthWorkoutMinutes = 790;

  static int monthlyWorkoutDays = 18;

  // =========================
  // TOTAL DATA
  // =========================

  static int totalWorkoutMinutes = 1240;

  // =========================
  // WEEKLY ACTIVITY
  // =========================

  static List<double> weeklyActivity = [
    0.4,
    0.7,
    0.5,
    0.9,
    0.6,
    0.8,
    0.65,
  ];

  static List<String> days = [
    'M',
    'T',
    'W',
    'T',
    'F',
    'S',
    'S',
  ];

  // =========================
  // DAILY ACTIVITIES
  // =========================

  static List<Map<String, dynamic>> dailyActivities = [
    {
      'title': 'Morning Walk',
      'time': '7:00 AM',
      'duration': '25 min',
      'icon': Icons.directions_walk,
      'color': Colors.green,
    },
    {
      'title': 'Afternoon Steps',
      'time': '1:30 PM',
      'duration': '18 min',
      'icon': Icons.directions_run,
      'color': Colors.orange,
    },
    {
      'title': 'Evening Workout',
      'time': '6:30 PM',
      'duration': '40 min',
      'icon': Icons.fitness_center,
      'color': Colors.blue,
    },
  ];

  // =========================
  // WORKOUTS
  // =========================

  static List<Map<String, dynamic>> workouts = [
    {
      'name': 'Morning Run',
      'duration': 30,
      'calories': 250,
      'difficulty': 'Medium',
      'icon': Icons.directions_run,
      'color': Colors.orange,
    },
    {
      'name': 'Cycling',
      'duration': 45,
      'calories': 350,
      'difficulty': 'Medium',
      'icon': Icons.directions_bike,
      'color': Colors.blue,
    },
    {
      'name': 'Yoga',
      'duration': 20,
      'calories': 120,
      'difficulty': 'Easy',
      'icon': Icons.self_improvement,
      'color': Colors.purple,
    },
    {
      'name': 'Strength Training',
      'duration': 40,
      'calories': 300,
      'difficulty': 'Hard',
      'icon': Icons.fitness_center,
      'color': Colors.red,
    },
    {
      'name': 'HIIT Workout',
      'duration': 25,
      'calories': 280,
      'difficulty': 'Hard',
      'icon': Icons.flash_on,
      'color': Colors.deepOrange,
    },
  ];

  static Set<String> completedWorkouts = {};

  // =========================
  // FOOD RECOMMENDATIONS
  // =========================

  static List<Map<String, dynamic>> foodRecommendations = [
    {
      'meal': 'Breakfast',
      'food': 'Oats + Banana + Nuts',
      'description': 'A balanced breakfast with carbohydrates, fiber and healthy fats.',
      'calories': 350,
      'icon': Icons.breakfast_dining,
      'color': Colors.orange,
    },
    {
      'meal': 'Lunch',
      'food': 'Rice + Dal + Vegetables',
      'description': 'A simple balanced meal containing carbohydrates, protein and vegetables.',
      'calories': 500,
      'icon': Icons.lunch_dining,
      'color': Colors.green,
    },
    {
      'meal': 'Snack',
      'food': 'Fruit + Yogurt',
      'description': 'A light snack that provides protein and natural carbohydrates.',
      'calories': 180,
      'icon': Icons.apple,
      'color': Colors.red,
    },
    {
      'meal': 'Dinner',
      'food': 'Chapati + Paneer + Salad',
      'description': 'A protein-rich dinner with vegetables and moderate carbohydrates.',
      'calories': 420,
      'icon': Icons.dinner_dining,
      'color': Colors.blue,
    },
  ];

  // =========================
  // COMPLETE WORKOUT
  // =========================

  static void completeWorkout(Map<String, dynamic> workout) {
    final String name = workout['name'];

    if (completedWorkouts.contains(name)) {
      completedWorkouts.remove(name);

      steps -= 50;
      calories -= 50;
      distance -= 0.3;

      todayWorkoutMinutes -= workout['duration'] as int;
      totalWorkoutMinutes -= workout['duration'] as int;
    } else {
      completedWorkouts.add(name);

      steps += 50;
      calories += 50;
      distance += 0.3;

      todayWorkoutMinutes += workout['duration'] as int;
      totalWorkoutMinutes += workout['duration'] as int;
    }
  }

  // =========================
  // CALCULATIONS
  // =========================

  static int get completedCount {
    return completedWorkouts.length;
  }

  static double get stepProgress {
    return (steps / stepGoal).clamp(0.0, 1.0);
  }

  static double get waterProgress {
    return (water / waterGoal).clamp(0.0, 1.0);
  }

  static double get sleepProgress {
    return (sleep / sleepGoal).clamp(0.0, 1.0);
  }

  static double get stepsImprovement {
    return ((currentMonthSteps - previousMonthSteps) /
            previousMonthSteps) *
        100;
  }

  static double get caloriesImprovement {
    return ((currentMonthCalories - previousMonthCalories) /
            previousMonthCalories) *
        100;
  }

  static double get workoutImprovement {
    return ((currentMonthWorkoutMinutes -
                previousMonthWorkoutMinutes) /
            previousMonthWorkoutMinutes) *
        100;
  }

  static String get totalWorkoutTime {
    final int hours = totalWorkoutMinutes ~/ 60;
    final int minutes = totalWorkoutMinutes % 60;

    if (hours == 0) {
      return '$minutes min';
    }

    return '$hours hr $minutes min';
  }

  static String get todayWorkoutTime {
    return '$todayWorkoutMinutes min';
  }
}