import 'package:flutter/material.dart';

class LoginScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color(0xFFEDE7F6)], // gradient ringan
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Teks judul
                  Text(
                    "Log in to HabitHUB",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),

                  // Teks deskripsi
                  Text(
                    "Welcome back! Sign in using your social account or email to continue us",
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),

                  // Tombol login dengan akun sosial
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          'assets/facebook.png',
                          width: 40,
                          height: 40,
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(width: 20),
                      IconButton(
                        icon: Image.asset(
                          'assets/google.png',
                          width: 40,
                          height: 40,
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(width: 20),
                      IconButton(
                        icon: Image.asset(
                          'assets/apple.png',
                          width: 40,
                          height: 40,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Pembatas dengan teks "OR"
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("OR", style: TextStyle(color: Colors.grey)),
                      ),
                      Expanded(child: Divider(color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Kotak teks untuk Email
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                  SizedBox(height: 15),

                  // Kotak teks untuk Password
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                  SizedBox(height: 30),

                  // Tombol Login
                  ElevatedButton(
                    onPressed: () {
                      // Aksi ketika tombol Login ditekan
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      // // Bottom Navigation Bar (optional jika Anda ingin menambahkannya)
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.white,
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(vertical: 10),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         Icon(Icons.calendar_today, color: Colors.grey),
      //         Icon(Icons.analytics, color: Colors.grey),
      //         Icon(Icons.person, color: Colors.grey),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
