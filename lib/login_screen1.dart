import 'package:flutter/material.dart';
import 'login_screen2.dart';
import 'create_account_screen.dart';

class LoginScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFD1C4E9), Color(0xFFBBDEFB)], // warna gradient
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Teks judul
                  Text(
                    "Do your tasks\nquickly and easy",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.3,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Your tasks, your rules, our support.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),

                  // Tombol Login
                  ElevatedButton(
                    onPressed: () {
                      // Aksi untuk tombol Login
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen2()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                    ),
                    child: Text("Login"),
                  ),
                  SizedBox(height: 10),

                  // Teks untuk membuat akun
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateAccountScreen()),
                      );
                    },
                    child: Text(
                      "Create an account",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),

                  // Pembatas dengan teks "OR"
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("OR"),
                        ),
                        Expanded(child: Divider(color: Colors.grey)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),

                  // Ikon Login dengan sosial media
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          'assets/facebook.png',
                          width: 40,
                          height: 40,
                        ),
                        onPressed: () {
                          // Aksi login dengan Facebook
                        },
                      ),
                      SizedBox(width: 20),
                      IconButton(
                        icon: Image.asset(
                          'assets/google.png',
                          width: 40,
                          height: 40,
                        ),
                        onPressed: () {
                          // Aksi login dengan Google
                        },
                      ),
                      SizedBox(width: 20),
                      IconButton(
                        icon: Image.asset(
                          'assets/apple.png',
                          width: 40,
                          height: 40,
                        ),
                        onPressed: () {
                          // Aksi login dengan Apple
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
