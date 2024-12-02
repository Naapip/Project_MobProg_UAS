import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:project_mobprog_uas/home/home_screen.dart';
import 'login/login_screen1.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'T-Track',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: AuthCheck(), // Menambahkan halaman AuthCheck untuk cek status login
    );
  }
}

class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengecek apakah pengguna sudah login
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance
          .authStateChanges(), // Menyaring perubahan status login
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            // Jika sudah login, arahkan ke HomeScreen
            return HomeScreen();
          } else {
            // Jika belum login, arahkan ke LoginScreen
            return LoginScreen1();
          }
        } else {
          // Menunggu data pengguna, bisa menampilkan loading screen
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
