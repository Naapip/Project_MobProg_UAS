import 'package:flutter/material.dart';

class CategoryDetailScreen extends StatelessWidget {
  final String activityName;
  final List<String> details;
  final Color color;

  const CategoryDetailScreen({
    super.key,
    required this.activityName,
    required this.details,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(activityName),
        backgroundColor: color,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: details.length,
        itemBuilder: (context, index) {
          return Card(
            color: color.withOpacity(0.3),
            child: ListTile(
              title: Text(details[index]),
            ),
          );
        },
      ),
    );
  }
}
