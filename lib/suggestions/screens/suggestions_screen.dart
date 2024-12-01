import 'package:flutter/material.dart';
import 'package:project_mobprog_uas/newtask/newtask.dart';

class SuggestionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Daftar aktivitas dengan kategori
    final List<Map<String, dynamic>> activities = [
      // Daily Routine
      {
        'name': 'Morning Exercise',
        'description': 'Start your day with energy.',
        'color': const Color(0xFFA5D6A7),
        'isCompleted': false,
        'category': 'Daily Routine',
      },
      {
        'name': 'Breakfast',
        'description': 'Have a healthy breakfast.',
        'color': const Color(0xFFFFF59D),
        'isCompleted': false,
        'category': 'Daily Routine',
      },
      {
        'name': 'Meditation',
        'description': 'Relax your mind for the day.',
        'color': const Color(0xFF81D4FA),
        'isCompleted': false,
        'category': 'Daily Routine',
      },
      {
        'name': 'Clean Room',
        'description': 'Start your day with a tidy room.',
        'color': const Color(0xFFF48FB1),
        'isCompleted': false,
        'category': 'Daily Routine',
      },
      // Study Routine
      {
        'name': 'Attend Lecture',
        'description': 'Learn something new.',
        'color': const Color(0xFFB39DDB),
        'isCompleted': false,
        'category': 'Study Routine',
      },
      {
        'name': 'Complete Assignment',
        'description': 'Work on your assignments.',
        'color': const Color(0xFF90CAF9),
        'isCompleted': false,
        'category': 'Study Routine',
      },
      {
        'name': 'Review Notes',
        'description': 'Revise what you learned.',
        'color': const Color(0xFFFFAB91),
        'isCompleted': false,
        'category': 'Study Routine',
      },
      {
        'name': 'Group Study',
        'description': 'Collaborate with peers.',
        'color': const Color(0xFFCE93D8),
        'isCompleted': false,
        'category': 'Study Routine',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Suggestions',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xFFEEE5FF),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) {
          // Mendapatkan aktivitas saat ini
          final Map<String, dynamic> activity = activities[index];
          return Card(
            color: activity['color'],
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(
                activity['name'],
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${activity['description']} (${activity['category']})',
                style: const TextStyle(color: Colors.black54),
              ),
              onTap: () {
                // Mengembalikan data aktivitas ke halaman sebelumnya
                Navigator.pop(context, activity);
              },
            ),
          );
        },
      ),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 16.0), // Jarak dari bawah
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       // Navigasi ke NewTaskPage
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => const NewTaskPage()),
      //       );
      //     },
      //     backgroundColor: const Color(0xFF7F56D9), // Ungu gelap
      //     child: const Icon(Icons.add, color: Colors.white),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
