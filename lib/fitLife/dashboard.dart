import 'package:flutter/material.dart';
import 'fitness_data.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildGreeting(),

          const SizedBox(height: 20),

          _buildTodayCard(),

          const SizedBox(height: 20),

          const Text(
            "Today's Activity",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: _activityCard(
                  'Steps',
                  '${FitnessData.steps}',
                  'of ${FitnessData.stepGoal}',
                  Icons.directions_walk,
                  Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _activityCard(
                  'Calories',
                  '${FitnessData.calories}',
                  'kcal',
                  Icons.local_fire_department,
                  Colors.orange,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: _activityCard(
                  'Distance',
                  FitnessData.distance.toStringAsFixed(1),
                  'km',
                  Icons.map,
                  Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _activityCard(
                  'Active Time',
                  '${FitnessData.todayWorkoutMinutes}',
                  'min',
                  Icons.timer,
                  Colors.purple,
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          _buildHealthTracking(),

          const SizedBox(height: 22),

          _buildWeeklyActivity(),

          const SizedBox(height: 22),

          _buildMonthlyImprovement(),

          const SizedBox(height: 22),

          _buildDailyTimeline(),

          const SizedBox(height: 22),

          _buildFoodRecommendation(),

          const SizedBox(height: 22),

          _buildStreakCard(),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // --------------------------------------------------
  // GREETING
  // --------------------------------------------------

  Widget _buildGreeting() {
    final int hour = DateTime.now().hour;

    String greeting;

    if (hour < 12) {
      greeting = 'Good Morning';
    } else if (hour < 17) {
      greeting = 'Good Afternoon';
    } else {
      greeting = 'Good Evening';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$greeting, ${FitnessData.userName} 👋',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Here is your fitness summary for today.',
          style: TextStyle(
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  // --------------------------------------------------
  // DAILY STEP GOAL
  // --------------------------------------------------

  Widget _buildTodayCard() {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.12),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.directions_walk,
                    color: Colors.green,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 15),
                const Expanded(
                  child: Text(
                    'Daily Step Goal',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '${FitnessData.steps}/${FitnessData.stepGoal}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            LinearProgressIndicator(
              value: FitnessData.stepProgress,
              minHeight: 10,
              backgroundColor: Colors.green.withOpacity(0.1),
              valueColor:
                  const AlwaysStoppedAnimation<Color>(
                Colors.green,
              ),
            ),

            const SizedBox(height: 10),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${(FitnessData.stepProgress * 100).toInt()}% completed today',
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --------------------------------------------------
  // ACTIVITY CARD
  // --------------------------------------------------

  Widget _activityCard(
    String title,
    String value,
    String unit,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: color,
              size: 28,
            ),

            const SizedBox(height: 12),

            Text(
              title,
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              value,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              unit,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --------------------------------------------------
  // WATER + SLEEP
  // --------------------------------------------------

  Widget _buildHealthTracking() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Health Tracking',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        Card(
          elevation: 0,
          child: Column(
            children: [
              _healthRow(
                'Water Intake',
                '${FitnessData.water.toStringAsFixed(1)} L / '
                    '${FitnessData.waterGoal.toStringAsFixed(1)} L',
                FitnessData.waterProgress,
                Icons.water_drop,
                Colors.blue,
              ),

              const Divider(),

              _healthRow(
                'Sleep',
                '${FitnessData.sleep.toStringAsFixed(1)} hrs / '
                    '${FitnessData.sleepGoal.toStringAsFixed(1)} hrs',
                FitnessData.sleepProgress,
                Icons.bedtime,
                Colors.indigo,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _healthRow(
    String title,
    String value,
    double progress,
    IconData icon,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.12),
            child: Icon(
              icon,
              color: color,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  value,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 8),

                LinearProgressIndicator(
                  value: progress,
                  minHeight: 6,
                  backgroundColor:
                      color.withOpacity(0.1),
                  valueColor:
                      AlwaysStoppedAnimation<Color>(
                    color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --------------------------------------------------
  // WEEKLY ACTIVITY
  // --------------------------------------------------

  Widget _buildWeeklyActivity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Weekly Activity',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: SizedBox(
              height: 170,
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                crossAxisAlignment:
                    CrossAxisAlignment.end,
                children: List.generate(
                  FitnessData.weeklyActivity.length,
                  (index) {
                    final double value =
                        FitnessData.weeklyActivity[index];

                    return Column(
                      mainAxisAlignment:
                          MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 130 * value,
                          width: 22,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.circular(10),
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          FitnessData.days[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // --------------------------------------------------
  // MONTHLY IMPROVEMENT
  // --------------------------------------------------

  Widget _buildMonthlyImprovement() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Monthly Improvements',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _improvementRow(
                  'Steps',
                  FitnessData.stepsImprovement,
                  Icons.directions_walk,
                ),

                const Divider(),

                _improvementRow(
                  'Calories Burned',
                  FitnessData.caloriesImprovement,
                  Icons.local_fire_department,
                ),

                const Divider(),

                _improvementRow(
                  'Workout Time',
                  FitnessData.workoutImprovement,
                  Icons.timer,
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 8),

        Text(
          'Compared with your previous month',
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _improvementRow(
    String title,
    double percentage,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor:
                Colors.green.withOpacity(0.12),
            child: Icon(
              icon,
              color: Colors.green,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const Icon(
            Icons.trending_up,
            color: Colors.green,
          ),

          const SizedBox(width: 5),

          Text(
            '+${percentage.toStringAsFixed(1)}%',
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // --------------------------------------------------
  // DAILY TIMELINE
  // --------------------------------------------------

  Widget _buildDailyTimeline() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Today's Activity Timeline",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        Card(
          elevation: 0,
          child: Column(
            children: FitnessData.dailyActivities
                .map<Widget>(
                  (activity) {
                    final Color activityColor =
                        activity['color'] as Color;

                    final IconData activityIcon =
                        activity['icon'] as IconData;

                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            activityColor.withOpacity(0.12),
                        child: Icon(
                          activityIcon,
                          color: activityColor,
                        ),
                      ),

                      title: Text(
                        activity['title'].toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      subtitle: Text(
                        '${activity['time']} • '
                        '${activity['duration']}',
                      ),

                      trailing: const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                    );
                  },
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  // --------------------------------------------------
  // FOOD RECOMMENDATION
  // --------------------------------------------------

  Widget _buildFoodRecommendation() {
    final Map<String, dynamic> food =
        FitnessData.foodRecommendations[0];

    final Color foodColor =
        food['color'] as Color;

    final IconData foodIcon =
        food['icon'] as IconData;

    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor:
                  foodColor.withOpacity(0.12),
              child: Icon(
                foodIcon,
                color: foodColor,
                size: 28,
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Today's Food Recommendation",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    food['food'].toString(),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    '${food['calories']} kcal',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/food',
                );
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --------------------------------------------------
  // STREAK
  // --------------------------------------------------

  Widget _buildStreakCard() {
    return Card(
      color: Colors.orange.shade50,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            const Icon(
              Icons.local_fire_department,
              color: Colors.orange,
              size: 38,
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    '${FitnessData.fitnessStreak} Day Streak!',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    "Keep your streak alive by completing today's activity.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}