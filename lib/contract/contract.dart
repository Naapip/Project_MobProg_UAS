import 'package:flutter/material.dart';
import 'package:project_mobprog_uas/home/home_screen.dart';

void main() {
  runApp(ContractApp());
}

class ContractApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContractScreen(),
    );
  }
}

class ContractScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Productivity Contract",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ContractItem(text: "Plan Tasks.", icon: Icons.wb_sunny),
                  ContractItem(text: "Set goals.", icon: Icons.track_changes),
                  ContractItem(
                      text: "Take breaks.", icon: Icons.accessibility_new),
                  ContractItem(
                      text: "Move and refresh.", icon: Icons.fitness_center),
                  ContractItem(text: "Prioritize.", icon: Icons.edit),
                  ContractItem(text: "Break tasks down.", icon: Icons.search),
                  ContractItem(text: "No multitasking.", icon: Icons.cancel),
                  ContractItem(
                      text: "Minimize distractions.",
                      icon: Icons.remove_circle),
                  ContractItem(text: "Limit social media.", icon: Icons.alarm),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 10,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Text(
                      "I AGREE",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
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

class ContractItem extends StatelessWidget {
  final String text;
  final IconData icon;

  ContractItem({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.purple,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
