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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF000000), // Hitam
              Color(0xFFC0C0C0), // Silver
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
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
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        trailing:
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
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
