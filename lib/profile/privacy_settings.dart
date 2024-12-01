import 'package:flutter/material.dart';

class PrivacySettingsPage extends StatefulWidget {
  @override
  _PrivacySettingsPageState createState() => _PrivacySettingsPageState();
}

class _PrivacySettingsPageState extends State<PrivacySettingsPage> {
  bool _isNotificationsEnabled = true;
  bool _isLocationSharingEnabled = false;
  bool _isDataTrackingEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Privacy Settings',
          style: TextStyle(color: Colors.black), // Text hitam di AppBar
        ),
        backgroundColor:
            const Color(0xFFEADCF8), // Background ungu pastel untuk AppBar
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSettingTile(
              title: 'Enable Notifications',
              subtitle: 'Receive notifications about updates',
              value: _isNotificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _isNotificationsEnabled = value;
                });
              },
            ),
            _buildSettingTile(
              title: 'Share Location',
              subtitle: 'Allow sharing of your location',
              value: _isLocationSharingEnabled,
              onChanged: (bool value) {
                setState(() {
                  _isLocationSharingEnabled = value;
                });
              },
            ),
            _buildSettingTile(
              title: 'Enable Data Tracking',
              subtitle: 'Allow data tracking for personalized ads',
              value: _isDataTrackingEnabled,
              onChanged: (bool value) {
                setState(() {
                  _isDataTrackingEnabled = value;
                });
              },
            ),
            const SizedBox(height: 20),
            _buildSaveButton(),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFEADCF8), // Background ungu pastel
    );
  }

  Widget _buildSettingTile({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white, // Background kartu putih
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ListTile(
        leading: const Icon(
          Icons.lock,
          color: Colors.black, // Ikon hitam
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black, // Teks hitam
          ),
        ),
        subtitle: Text(subtitle,
            style: const TextStyle(color: Colors.grey)), // Subteks abu-abu
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.black, // Warna switch aktif hitam
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black, // Background tombol hitam
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'Your privacy settings have been saved!',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black, // Background snack bar hitam
          ),
        );
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: Text(
          'Save Settings',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
