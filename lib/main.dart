import 'package:flutter/material.dart';

void main() {
  runApp(TodoContractApp());
}

class TodoContractApp extends StatelessWidget {
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
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Contract",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ContractItem(text: "Plan tasks.", icon: Icons.wb_sunny),
              ContractItem(text: "Set goals.", icon: Icons.track_changes),
              ContractItem(text: "Take breaks.", icon: Icons.accessibility_new),
              ContractItem(
                  text: "Move and refresh.", icon: Icons.fitness_center),
              ContractItem(text: "Prioritize.", icon: Icons.edit),
              ContractItem(text: "Break tasks down.", icon: Icons.search),
              ContractItem(text: "No multitasking.", icon: Icons.cancel),
              ContractItem(
                  text: "Minimize distractions.", icon: Icons.remove_circle),
              ContractItem(text: "Limit social media.", icon: Icons.alarm),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Fungsi setelah menekan tombol "I AGREE"
                  print("User agreed to the contract");
                },
                child: Text(
                  "I AGREE",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
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
            color: Colors.orange,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today, color: Colors.grey),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.view_list, color: Colors.grey),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Colors.grey),
          label: '',
        ),
      ],
    );
  }
}
