import 'package:flutter/material.dart';

class AllActivitiesScreen extends StatelessWidget {
  final String category;
  final List<String> activities;
  final Color color;

  const AllActivitiesScreen({
    super.key,
    required this.category,
    required this.activities,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        backgroundColor: color,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: activities.length,
        itemBuilder: (context, index) {
          return Card(
            color: color.withOpacity(0.3),
            child: ListTile(
              title: Text(activities[index]),
            ),
          );
        },
      ),
    );
  }
}
