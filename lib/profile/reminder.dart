import 'package:flutter/material.dart';

class ReminderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reminder',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black), // Teks hitam di AppBar
        ),
        backgroundColor: Colors.white, // Latar belakang putih pada AppBar
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Don\'t forget your meeting at 3 PM today. Make sure you\'re prepared!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Teks hitam untuk deskripsi
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Your meeting with the team is about to begin. Please gather all your materials and be ready to present your progress.',
              style: TextStyle(fontSize: 16, color: Colors.black87), // Teks hitam dengan opacity
            ),
            SizedBox(height: 32),
            Icon(Icons.event_available, size: 100, color: Colors.black), // Ikon hitam
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Kembali ke halaman sebelumnya
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Latar belakang tombol hitam
              ),
              child: Text(
                'Back to Notifications',
                style: TextStyle(color: Colors.white), // Teks putih pada tombol
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white, // Latar belakang putih untuk halaman
    );
  }
}
