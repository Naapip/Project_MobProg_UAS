import 'package:flutter/material.dart';
import 'package:project_mobprog_uas/profile/edit_profile.dart';
import 'package:project_mobprog_uas/profile/personalInformation.dart';
import 'package:project_mobprog_uas/profile/privacy_settings.dart'; // Import halaman edit profile

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String name = 'Megan Fox';
  String email = 'meganfox666@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.white, // Ganti background AppBar menjadi putih
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile Picture Section
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/meganfox.jpg'),
              ),
              const SizedBox(height: 16),
              Text(
                name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black), // Teks hitam
              ),
              const SizedBox(height: 8),
              Text(
                email,
                style: const TextStyle(fontSize: 16, color: Colors.grey), // Teks abu-abu
              ),
              const SizedBox(height: 16),

              // Edit Profile and Settings Buttons
              ElevatedButton.icon(
                onPressed: () async {
                  final updatedData = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfilePage(
                        currentName: name,
                        currentEmail: email,
                      ),
                    ),
                  );

                  if (updatedData != null) {
                    setState(() {
                      name = updatedData['name'];
                      email = updatedData['email'];
                    });
                  }
                },
                icon: Icon(Icons.edit, color: Colors.white),
                label: Text('Edit Profile', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Ganti tombol jadi hitam
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
              const SizedBox(height: 16),

              const Divider(color: Colors.black), // Divider hitam

              // Account Options
              ListTile(
                leading: const Icon(Icons.person_outline, color: Colors.black),
                title: const Text('Personal Information', style: TextStyle(color: Colors.black)),
                subtitle: const Text('Update your personal details', style: TextStyle(color: Colors.grey)),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PersonalInformationPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.lock_outline, color: Colors.black),
                title: const Text('Privacy Settings', style: TextStyle(color: Colors.black)),
                subtitle: const Text('Manage your privacy options', style: TextStyle(color: Colors.grey)),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PrivacySettingsPage()),
                  );
                },
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white, // Ganti background halaman menjadi putih
    );
  }
}
