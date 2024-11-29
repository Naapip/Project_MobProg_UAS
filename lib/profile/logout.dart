import 'package:flutter/material.dart';
import 'package:project_mobprog_uas/login/login_screen1.dart';
import '../profile/logout.dart';

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Logout',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black), // Teks hitam di AppBar
        ),
        backgroundColor: Colors.white, // Latar belakang putih pada AppBar
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon dan Pesan Logout
            Icon(
              Icons.exit_to_app,
              size: 80,
              color: Colors.black, // Menggunakan warna hitam untuk ikon
            ),
            SizedBox(height: 20),
            Text(
              'Are you sure you want to logout?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Menggunakan warna hitam untuk teks
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'You will be logged out from your account and will need to log in again.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54, // Warna abu-abu untuk teks penjelasan
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),

            // Tombol untuk Logout
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman login
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen1()),
                  (route) => false, // Menghapus semua rute sebelumnya
                );
              },
              child: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Teks putih pada tombol
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Tombol dengan background hitam
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Tombol untuk Membatalkan Logout
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Kembali ke halaman sebelumnya jika membatalkan logout
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black, // Warna teks Cancel dengan hitam
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}