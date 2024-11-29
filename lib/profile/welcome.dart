import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome!',
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
              'Thanks for joining our platform! We\'re excited to have you with us.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Teks hitam
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Start exploring your dashboard and enjoy all the features we offer. If you need help, feel free to contact our support team.',
              style: TextStyle(fontSize: 16, color: Colors.black87), // Teks hitam dengan opacity
            ),
            SizedBox(height: 32),
            Icon(Icons.sentiment_very_satisfied, size: 100, color: Colors.black), // Ikon hitam
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
      backgroundColor: Colors.white, // Latar belakang halaman putih
    );
  }
}
