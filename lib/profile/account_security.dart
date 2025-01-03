import 'package:flutter/material.dart';

class AccountSecurityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account Security',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black), // Teks hitam di AppBar
        ),
        backgroundColor:
            const Color(0xFFEADCF8), // Latar belakang ungu pastel pada AppBar
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your password was changed successfully. If this wasn\'t you, contact support immediately.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Teks hitam
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'To protect your account, we recommend enabling two-factor authentication and reviewing your recent login activity.',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87), // Teks hitam dengan opacity
            ),
            const SizedBox(height: 32),
            const Icon(Icons.lock,
                size: 100, color: Colors.black), // Ikon hitam
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Kembali ke halaman sebelumnya
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Latar belakang tombol hitam
              ),
              child: const Text(
                'Back to Notifications',
                style: TextStyle(color: Colors.white), // Teks putih pada tombol
              ),
            ),
          ],
        ),
      ),
      backgroundColor:
          const Color(0xFFEADCF8), // Latar belakang ungu pastel untuk halaman
    );
  }
}
