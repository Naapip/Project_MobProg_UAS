import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final String currentName;
  final String currentEmail;

  EditProfilePage({required this.currentName, required this.currentEmail});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.currentName);
    _emailController = TextEditingController(text: widget.currentEmail);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black), // Warna teks hitam untuk AppBar
        ),
        backgroundColor: Colors.white, // Warna latar belakang AppBar menjadi putih
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Field untuk mengedit nama
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.black), // Warna label hitam
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Field untuk mengedit email
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.black), // Warna label hitam
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            // Tombol untuk menyimpan perubahan
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'name': _nameController.text,
                  'email': _emailController.text,
                });
              },
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white, // Teks putih pada tombol
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Warna tombol hitam
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
