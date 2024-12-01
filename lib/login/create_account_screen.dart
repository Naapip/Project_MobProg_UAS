import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import '../login/login_screen1.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _emailError;
  String? _passwordError;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
    return emailRegex.hasMatch(email);
  }

  bool _isValidPassword(String password) {
    return password.length >= 6;
  }

  Future<void> _createUserAccount() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final name = _nameController.text;

    bool isEmailValid = _isValidEmail(email);
    bool isPasswordValid = _isValidPassword(password);

    if (!isEmailValid) {
      setState(() {
        _emailError = 'Please enter a valid Email address.';
      });
    }

    if (!isPasswordValid) {
      setState(() {
        _passwordError = 'Password must be at least 6 characters.';
      });
    }

    if (isEmailValid && isPasswordValid) {
      try {
        // Create user with FirebaseAuth
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Get the user ID from FirebaseAuth
        String userId = userCredential.user!.uid;

        // Save additional user information (name, etc.) in Firestore
        await FirebaseFirestore.instance.collection('users').doc(userId).set({
          'name': name,
          'email': email,
        });

        // Sign out after successful registration (optional)
        await _auth.signOut();

        // Show success message and navigate back to login screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Account Created Successfully'),
              content:
                  Text('Your account has been created. You can now log in.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close dialog
                    Navigator.pop(context); // Go back to LoginScreen1
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } on FirebaseAuthException catch (e) {
        String errorMessage = 'Registration failed. Please try again.';
        if (e.code == 'email-already-in-use') {
          errorMessage = 'Email is already in use. Please try another one.';
        } else if (e.code == 'weak-password') {
          errorMessage = 'Password is too weak.';
        }

        setState(() {
          _emailError = errorMessage;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFB9E4FE), // Biru muda
              Color(0xFFD6BBF3), // Ungu lembut
              Color(0xFFFFFFFF), // Putih
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Create your account using your email to get started',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),

                  // Input Nama
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),

                  // Input Email
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      errorText: _emailError,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 15),

                  // Input Password
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      errorText: _passwordError,
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 30),

                  // Tombol Create Account
                  ElevatedButton(
                    onPressed: _createUserAccount,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                      shadowColor: Colors.black.withOpacity(0.2),
                    ),
                    child: Text(
                      "Create Account",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
