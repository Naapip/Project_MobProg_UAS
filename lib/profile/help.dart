import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Help',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black), // Teks hitam di AppBar
        ),
        backgroundColor:
            const Color(0xFFEADCF8), // Latar belakang ungu pastel pada AppBar
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Heading bagian utama
            const Text(
              'Welcome to the Help Center!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Teks hitam
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Need assistance? You\'ve come to the right place. Find useful information on how to use the app and troubleshoot common issues.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87, // Teks hitam dengan sedikit transparansi
              ),
            ),
            const SizedBox(height: 30),

            // Container yang berisi daftar topik
            Container(
              decoration: BoxDecoration(
                color: Colors.black
                    .withOpacity(0.1), // Latar belakang transparan hitam
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black), // Border hitam
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHelpTopic(
                    title: '1. Getting Started',
                    description:
                        'Learn how to set up your profile and get familiar with the app.',
                  ),
                  _buildHelpTopic(
                    title: '2. Key Features',
                    description:
                        'Discover the app\'s key features and how they can help you get the most out of it.',
                  ),
                  _buildHelpTopic(
                    title: '3. Troubleshooting',
                    description:
                        'Having issues? Here you\'ll find solutions for common problems and errors.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Penjelasan fitur aplikasi
            _buildFeatureSection(context),

            const SizedBox(height: 40),

            // Tombol Kontak Dukungan
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Action untuk tombol kontak dukungan
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Contact Support',
                            style: TextStyle(color: Colors.black)),
                        content: const Text(
                          'If you need help, please reach out to our support team!',
                          style: TextStyle(color: Colors.black87),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Close',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.phone_in_talk, color: Colors.white),
                label: const Text(
                  'Contact Support',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Latar belakang tombol hitam
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method untuk membangun setiap topik
  Widget _buildHelpTopic({required String title, required String description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Teks hitam
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(
              fontSize: 16,
              color: Colors.black87), // Teks hitam dengan sedikit transparansi
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  // Method untuk menampilkan penjelasan fitur aplikasi
  Widget _buildFeatureSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Key Features of the App',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Teks hitam
          ),
        ),
        const SizedBox(height: 16),
        // Fitur 1
        _buildFeatureItem(
          context,
          icon: Icons.message,
          title: 'Instant Messaging',
          description:
              'Stay connected with your contacts through instant messaging. Send text, photos, and videos with ease.',
        ),
        const Divider(),
        // Fitur 2
        _buildFeatureItem(
          context,
          icon: Icons.event_available,
          title: 'Event Scheduling',
          description:
              'Manage your events with the built-in scheduler. Set reminders and get notifications about upcoming events.',
        ),
        const Divider(),
        // Fitur 3
        _buildFeatureItem(
          context,
          icon: Icons.lock,
          title: 'Account Security',
          description:
              'Your privacy and security are important. Use two-factor authentication to protect your account.',
        ),
        const Divider(),
        // Fitur 4
        _buildFeatureItem(
          context,
          icon: Icons.system_update,
          title: 'App Updates',
          description:
              'Keep your app up-to-date with the latest features and bug fixes. Receive notifications when updates are available.',
        ),
      ],
    );
  }

  // Method untuk membangun setiap item fitur
  Widget _buildFeatureItem(BuildContext context,
      {required IconData icon,
      required String title,
      required String description}) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor:
            Colors.black.withOpacity(0.1), // Latar belakang transparan hitam
        child: Icon(icon, color: Colors.black), // Ikon hitam
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black), // Teks hitam
      ),
      subtitle: Text(
        description,
        style: const TextStyle(
            fontSize: 16,
            color: Colors.black87), // Teks hitam dengan sedikit transparansi
      ),
      onTap: () {
        // Navigasi ke halaman terkait (jika ada halaman terpisah untuk fitur)
        // Navigator.push(context, MaterialPageRoute(builder: (context) => SomeFeaturePage()));
      },
    );
  }
}
