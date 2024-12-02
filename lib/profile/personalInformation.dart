import 'package:flutter/material.dart';

class PersonalInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal Information',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFEADCF8), // Ungu pastel
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildInfoCard('Name', 'User Name', Icons.person),
            _buildInfoCard('Email', 'user@example.com', Icons.email),
            _buildInfoCard('Phone', '+62 812345678910', Icons.phone),
            _buildInfoCard('Address', 'Jl. Taman S Parman', Icons.home),
            _buildInfoCard('Date of Birth', '5 May 2005', Icons.cake),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFEADCF8), // Latar belakang ungu pastel
    );
  }

  Widget _buildInfoCard(String label, String value, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      color: const Color(0xFFFFFFFF), // Warna kartu tetap putih
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF6A4A86)), // Ikon ungu tua
        title: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black, // Teks hitam
          ),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(color: Colors.grey), // Teks subtitel abu-abu
        ),
      ),
    );
  }
}
