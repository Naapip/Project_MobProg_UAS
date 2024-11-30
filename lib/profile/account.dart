import 'package:flutter/material.dart';
import 'package:project_mobprog_uas/profile/edit_profile.dart';
import 'package:project_mobprog_uas/profile/personalInformation.dart';
import 'package:project_mobprog_uas/profile/privacy_settings.dart';
import 'package:project_mobprog_uas/login/login_screen2.dart';

class AccountPage extends StatefulWidget {
  final String name; // Tambahkan parameter name
  final String email; // Tambahkan parameter email

  const AccountPage({Key? key, required this.name, required this.email})
      : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late String name;
  late String email;

  @override
  void initState() {
    super.initState();
    name = widget.name; // Ambil data dari parameter
    email = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                    'assets/meganfox.jpg'), // Ganti dengan gambar lain jika perlu
              ),
              const SizedBox(height: 16),
              Text(
                name,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 8),
              Text(
                email,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 16),
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
                icon: const Icon(Icons.edit, color: Colors.white),
                label: const Text('Edit Profile',
                    style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
              const SizedBox(height: 16),
              const Divider(color: Colors.black),
              ListTile(
                leading: const Icon(Icons.person_outline, color: Colors.black),
                title: const Text('Personal Information',
                    style: TextStyle(color: Colors.black)),
                subtitle: const Text('Update your personal details',
                    style: TextStyle(color: Colors.grey)),
                trailing: const Icon(Icons.arrow_forward_ios,
                    size: 16, color: Colors.black),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PersonalInformationPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.lock_outline, color: Colors.black),
                title: const Text('Privacy Settings',
                    style: TextStyle(color: Colors.black)),
                subtitle: const Text('Manage your privacy options',
                    style: TextStyle(color: Colors.grey)),
                trailing: const Icon(Icons.arrow_forward_ios,
                    size: 16, color: Colors.black),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PrivacySettingsPage()),
                  );
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
