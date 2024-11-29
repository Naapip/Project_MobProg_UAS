import 'package:flutter/material.dart';  // Pastikan file ini ada di folder yang sesuai
import 'update.available.dart';
import 'reminder.dart';
import 'account_security.dart';
import 'welcome.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)), // Teks hitam di AppBar
        backgroundColor: Colors.white, // Background putih untuk AppBar
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: 16),
            Text(
              'Recent Notifications',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Teks hitam
              ),
            ),
            _buildNotificationTile(
              context,
              title: 'Update Available',
              description: 'A new update is ready to install. Please update to the latest version.',
              icon: Icons.system_update,
              time: '30 min ago',
              page: UpdateAvailablePage(),  // Mengarahkan ke halaman Update Available
            ),
            _buildNotificationTile(
              context,
              title: 'Reminder',
              description: 'Don\'t forget your meeting at 3 PM today. Make sure you\'re prepared!',
              icon: Icons.event_available,
              time: '1 hour ago',
              page: ReminderPage(),  // Mengarahkan ke halaman Reminder
            ),
            SizedBox(height: 16),
            Divider(),
            SizedBox(height: 16),
            Text(
              'Earlier Notifications',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700], // Teks abu-abu untuk kategori 'Earlier Notifications'
              ),
            ),
            _buildNotificationTile(
              context,
              title: 'Account Security',
              description: 'Your password was changed successfully. If this wasn\'t you, contact support immediately.',
              icon: Icons.lock,
              time: 'Yesterday',
              page: AccountSecurityPage(),  // Mengarahkan ke halaman Account Security
            ),
            _buildNotificationTile(
              context,
              title: 'Welcome!',
              description: 'Thanks for joining our platform! We\'re excited to have you with us.',
              icon: Icons.waving_hand,
              time: '2 days ago',
              page: WelcomePage(),  // Mengarahkan ke halaman Welcome
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white, // Background putih untuk halaman utama
    );
  }

  Widget _buildNotificationTile(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required String time,
    required Widget page,  // Menambahkan parameter `page` untuk setiap halaman yang akan dituju
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.black.withOpacity(0.1),  // Lingkaran avatar dengan latar belakang hitam transparan
          child: Icon(icon, color: Colors.black), // Ikon hitam
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black), // Teks hitam untuk judul
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description, style: TextStyle(color: Colors.black)), // Deskripsi hitam
            SizedBox(height: 4),
            Text(
              time,
              style: TextStyle(color: Colors.grey, fontSize: 12), // Waktu berwarna abu-abu
            ),
          ],
        ),
        onTap: () {
          // Navigasi ke halaman detail sesuai dengan parameter `page`
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),  // Navigasi ke halaman yang sesuai
          );
        },
      ),
    );
  }
}
