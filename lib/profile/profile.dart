import 'package:flutter/material.dart';
import 'account.dart';
import 'notifications.dart';
import 'help.dart';
import 'invite_friend.dart';
import 'logout.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String email;

  const ProfilePage({Key? key, required this.name, required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFEADCF8), // Warna ungu pastel lembut
        elevation: 0,
        automaticallyImplyLeading: false, // Menghapus ikon back arrow otomatis
      ),
      body: Container(
        color: const Color(0xFFEADCF8), // Latar belakang ungu pastel
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              buildListTile(
                'Account',
                context,
                AccountPage(name: name, email: email), // Data diteruskan
              ),
              buildListTile('Notifications', context, NotificationsPage()),
              buildListTile('Help', context, HelpPage()),
              buildListTile('Invite a friend', context, InviteFriendPage()),
              buildListTile('Logout', context, LogoutPage()),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListTile(String title, BuildContext context, Widget page) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white, // Latar belakang putih
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Bayangan ringan
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black, // Teks hitam
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.black, // Ikon trailing hitam
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }
}
