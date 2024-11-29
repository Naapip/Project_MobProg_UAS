import 'package:flutter/material.dart';

class InviteFriendPage extends StatefulWidget {
  @override
  _InviteFriendPageState createState() => _InviteFriendPageState();
}

class _InviteFriendPageState extends State<InviteFriendPage> {
  String _inviteLink = 'https://example.com/invite?code=123456'; // Link default
  final TextEditingController _linkController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _linkController.text = _inviteLink; // Set default link ke controller
  }

  @override
  void dispose() {
    _linkController.dispose(); // Bersihkan controller saat widget dihancurkan
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Invite a Friend',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black), // Teks hitam di AppBar
        ),
        backgroundColor: Colors.white, // Latar belakang putih pada AppBar
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading Section
            Text(
              'Invite Your Friends and Get Rewards!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Teks hitam
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Share your unique invite link and earn rewards when your friends join!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87, // Teks hitam dengan transparansi sedikit
              ),
            ),
            SizedBox(height: 30),

            // Input Section for Invite Link
            TextField(
              controller: _linkController,
              style: TextStyle(color: Colors.black), // Warna teks hitam saat mengetik
              decoration: InputDecoration(
                labelText: 'Your Invite Link',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.copy, color: Colors.black), // Ikon hitam
                  onPressed: () {
                    // Logika untuk menyalin link ke clipboard
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Link copied to clipboard!')),
                    );
                  },
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _inviteLink = value; // Perbarui link berdasarkan input
                });
              },
            ),
            SizedBox(height: 20),

            // Display Updated Link Section
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1), // Latar belakang transparan hitam
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black), // Border hitam
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Updated Link:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Teks hitam
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _inviteLink,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black, // Teks hitam
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),

            // Social Media Sharing Section
            Text(
              'Or Share via Social Media',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Teks hitam
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.camera_alt, color: Colors.black), // Ikon hitam
                  iconSize: 40,
                  onPressed: () {
                    // Logika untuk berbagi via Instagram
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Shared on Instagram!'),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 30),

            // Invite Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logika untuk mengundang teman
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Invite sent using link: $_inviteLink')),
                  );
                },
                child: Text('Invite Now'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Latar belakang tombol hitam
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),

            // Footer Section
            Center(
              child: Text(
                'Get your friends to join and enjoy exclusive benefits together!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54, // Teks hitam dengan transparansi
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
