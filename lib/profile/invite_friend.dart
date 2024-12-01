import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for Clipboard functionality

class InviteFriendPage extends StatefulWidget {
  @override
  _InviteFriendPageState createState() => _InviteFriendPageState();
}

class _InviteFriendPageState extends State<InviteFriendPage> {
  String _inviteLink = 'https://example.com/invite?code=123456'; // Default link
  final TextEditingController _linkController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _linkController.text =
        _inviteLink; // Set the default invite link in controller
  }

  @override
  void dispose() {
    _linkController.dispose(); // Dispose controller when widget is destroyed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Invite a Friend',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
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
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Share your unique invite link and earn rewards when your friends join!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 30),

            // Input Section for Invite Link
            TextField(
              controller: _linkController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Your Invite Link',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.copy, color: Colors.black),
                  onPressed: () {
                    // Copy the invite link to clipboard
                    Clipboard.setData(ClipboardData(text: _inviteLink))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Link copied to clipboard!')),
                      );
                    });
                  },
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _inviteLink = value; // Update link based on user input
                });
              },
            ),
            SizedBox(height: 20),

            // Display Updated Link Section
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Updated Link:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _inviteLink,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
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
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.camera_alt, color: Colors.black),
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
                  // Simulate sending the invite
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Invite sent using link: $_inviteLink')),
                  );
                },
                child: Text('Invite Now'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
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
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
