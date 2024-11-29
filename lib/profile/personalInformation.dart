import 'package:flutter/material.dart';

class PersonalInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Information', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white, // Ganti background AppBar menjadi putih
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildInfoCard('Name', 'Megan Fox', Icons.person),
            _buildInfoCard('Email', 'meganfox666@gmail.com', Icons.email),
            _buildInfoCard('Phone', '+1 666 888 999', Icons.phone),
            _buildInfoCard('Address', 'Saint Mayers 178', Icons.home),
            _buildInfoCard('Date of Birth', '12 Desember 1998', Icons.cake),
          ],
        ),
      ),
      backgroundColor: Colors.white, // Ganti background halaman menjadi putih
    );
  }

  Widget _buildInfoCard(String label, String value, IconData icon) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      color: Colors.white, // Ganti background card menjadi putih
      child: ListTile(
        leading: Icon(icon, color: Colors.black), // Ganti warna ikon menjadi hitam
        title: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black), // Teks hitam
        ),
        subtitle: Text(value, style: TextStyle(color: Colors.grey)), // Teks abu-abu untuk subtitel
      ),
    );
  }
}
