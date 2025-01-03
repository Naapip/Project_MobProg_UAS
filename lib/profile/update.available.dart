import 'package:flutter/material.dart';

class UpdateAvailablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update Available',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black), // Teks hitam di AppBar
        ),
        backgroundColor:
            const Color(0xFFEADCF8), // Background ungu pastel pada AppBar
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'A new update is ready to install. Please update to the latest version.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Teks hitam untuk deskripsi
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'The update includes new features, bug fixes, and performance improvements. Make sure you are connected to Wi-Fi before starting the download.',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87), // Teks hitam dengan opacity
            ),
            const SizedBox(height: 32),
            const Icon(Icons.system_update,
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
          const Color(0xFFEADCF8), // Background ungu pastel untuk halaman
    );
  }
}
