import 'package:flutter/material.dart';

import 'fitness_data.dart';

class WorkoutsScreen extends StatefulWidget {
  const WorkoutsScreen({super.key});

  @override
  State<WorkoutsScreen> createState() =>
      _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Workouts',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            'Choose a workout and track your progress.',
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),

          const SizedBox(height: 20),

          _buildWorkoutSummary(),

          const SizedBox(height: 20),

          ...FitnessData.workouts.map(
            (workout) => _buildWorkoutCard(workout),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutSummary() {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround,
          children: [
            _summaryItem(
              '${FitnessData.completedCount}',
              'Completed',
              Icons.check_circle,
              Colors.green,
            ),
            _summaryItem(
              FitnessData.todayWorkoutTime,
              'Today',
              Icons.timer,
              Colors.blue,
            ),
            _summaryItem(
              FitnessData.totalWorkoutTime,
              'Total',
              Icons.history,
              Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryItem(
    String value,
    String title,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
          size: 28,
        ),
        const SizedBox(height: 7),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildWorkoutCard(
    Map<String, dynamic> workout,
  ) {
    final bool completed =
        FitnessData.completedWorkouts.contains(
      workout['name'],
    );

    final Color color = workout['color'];

    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 14),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 58,
                  width: 58,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.12),
                    borderRadius:
                        BorderRadius.circular(16),
                  ),
                  child: Icon(
                    workout['icon'],
                    color: color,
                    size: 30,
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        workout['name'],
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '${workout['duration']} min • ${workout['calories']} kcal',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),

                if (completed)
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Chip(
                  label: Text(
                    workout['difficulty'],
                  ),
                  avatar: const Icon(
                    Icons.speed,
                    size: 16,
                  ),
                ),

                const Spacer(),

                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      FitnessData.completeWorkout(
                        workout,
                      );
                    });
                  },
                  icon: Icon(
                    completed
                        ? Icons.undo
                        : Icons.play_arrow,
                  ),
                  label: Text(
                    completed
                        ? 'Undo'
                        : 'Complete',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}