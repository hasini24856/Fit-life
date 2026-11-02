import 'package:flutter/material.dart';

import 'fitness_data.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() =>
      _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildProfileHeader(),

          const SizedBox(height: 20),

          _buildPersonalDetails(),

          const SizedBox(height: 20),

          _buildFitnessGoal(),

          const SizedBox(height: 20),

          _buildStatistics(),

          const SizedBox(height: 20),

          _buildMonthlyProgress(),

          const SizedBox(height: 20),

          _buildSettings(),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/login',
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 48,
          backgroundColor:
              Colors.green.withOpacity(0.12),
          child: const Icon(
            Icons.person,
            size: 55,
            color: Colors.green,
          ),
        ),

        const SizedBox(height: 12),

        Text(
          FitnessData.userName,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 5),

        Text(
          FitnessData.email,
          style: TextStyle(
            color: Colors.grey.shade600,
          ),
        ),

        const SizedBox(height: 12),

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.12),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.local_fire_department,
                color: Colors.orange,
                size: 20,
              ),
              const SizedBox(width: 6),
              Text(
                '${FitnessData.fitnessStreak} day streak',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPersonalDetails() {
    return _sectionCard(
      title: 'Personal Details',
      icon: Icons.person_outline,
      children: [
        _detailRow(
          'Age',
          '${FitnessData.age} years',
        ),
        _detailRow(
          'Height',
          '${FitnessData.height.toStringAsFixed(0)} cm',
        ),
        _detailRow(
          'Weight',
          '${FitnessData.weight.toStringAsFixed(1)} kg',
        ),
        _detailRow(
          'Fitness Level',
          FitnessData.fitnessLevel,
        ),
      ],
    );
  }

  Widget _buildFitnessGoal() {
    return _sectionCard(
      title: 'Fitness Goal',
      icon: Icons.flag_outlined,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const CircleAvatar(
            backgroundColor: Color(0x1A4CAF50),
            child: Icon(
              Icons.favorite,
              color: Colors.green,
            ),
          ),
          title: Text(
            FitnessData.fitnessGoal,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: const Text(
            'Your current fitness focus',
          ),
        ),
      ],
    );
  }

  Widget _buildStatistics() {
    return _sectionCard(
      title: 'Your Statistics',
      icon: Icons.analytics_outlined,
      children: [
        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround,
          children: [
            _stat(
              '${FitnessData.completedCount}',
              'Workouts',
            ),
            _stat(
              FitnessData.totalWorkoutTime,
              'Workout Time',
            ),
            _stat(
              '${FitnessData.monthlyWorkoutDays}',
              'Active Days',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMonthlyProgress() {
    return _sectionCard(
      title: 'Monthly Progress',
      icon: Icons.trending_up,
      children: [
        _progressItem(
          'Steps',
          '${FitnessData.currentMonthSteps}',
          FitnessData.stepsImprovement,
        ),
        _progressItem(
          'Calories',
          '${FitnessData.currentMonthCalories} kcal',
          FitnessData.caloriesImprovement,
        ),
        _progressItem(
          'Workout Time',
          '${FitnessData.currentMonthWorkoutMinutes} min',
          FitnessData.workoutImprovement,
        ),
      ],
    );
  }

  Widget _progressItem(
    String title,
    String value,
    double improvement,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '+${improvement.toStringAsFixed(1)}%',
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettings() {
    return _sectionCard(
      title: 'App Settings',
      icon: Icons.settings_outlined,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.notifications_none),
          title: const Text('Notifications'),
          trailing: Switch(
            value: true,
            onChanged: (value) {},
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.restaurant),
          title: const Text('Food Recommendations'),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/food',
            );
          },
        ),
      ],
    );
  }

  Widget _sectionCard({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Colors.green,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            ...children,
          ],
        ),
      ),
    );
  }

  Widget _detailRow(
    String title,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _stat(
    String value,
    String title,
  ) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 11,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}