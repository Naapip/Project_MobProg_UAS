import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_mobprog_uas/login/login_screen1.dart';
import 'package:project_mobprog_uas/profile/profile.dart';
import 'package:table_calendar/table_calendar.dart';
import 'fl_chart.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String _selectedRoutine = 'All';

  final List<String> _defaultSuggestions = [
    "Read",
    "Study",
    "Running",
    "Cycling",
    "Mop the house",
    "Clean the bathroom"
  ];

  Map<String, List<Map<String, dynamic>>> _activities = {
    'Daily Routine': [],
    'Study Routine': [],
    'All': [],
  };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Mendapatkan data pengguna dari FirebaseAuth
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: const Color(0xFF2A2D3E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4E5481),
        elevation: 0,
        title: const Text("Today", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.cyanAccent),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (mounted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen1()),
                );
              }
            },
          ),
        ],
      ),
      body: _currentIndex == 0
          ? _buildHomeContent()
          : _currentIndex == 1
              ? AnalyticsScreen()
              : ProfilePage(
                  name: user?.displayName ??
                      "Unknown User", // Mengambil name dari Firebase
                  email: user?.email ??
                      "No email provided", // Mengambil email dari Firebase
                ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: const Color(0xFF4E5481),
        selectedItemColor: Colors.cyanAccent,
        unselectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildHomeContent() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: GestureDetector(
            onTap: () {
              if (mounted) {
                setState(() {
                  _calendarFormat = _calendarFormat == CalendarFormat.week
                      ? CalendarFormat.month
                      : CalendarFormat.week;
                });
              }
            },
            child: TableCalendar(
              firstDay: DateTime.utc(2000, 1, 1),
              lastDay: DateTime.utc(2100, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                if (mounted) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              },
              calendarStyle: const CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.cyanAccent,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.deepPurple,
                  shape: BoxShape.circle,
                ),
                defaultTextStyle: TextStyle(color: Colors.white),
                weekendTextStyle: TextStyle(color: Colors.cyanAccent),
              ),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildChoiceChip("All"),
              const SizedBox(width: 10),
              _buildChoiceChip("Daily Routine"),
              const SizedBox(width: 10),
              _buildChoiceChip("Study Routine"),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: _activities[_selectedRoutine]?.isEmpty ?? true
              ? const Center(
                  child: Text(
                    "No activities added yet.\nTap + to add activities!",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                )
              : ListView.builder(
                  itemCount: _activities[_selectedRoutine]!.length,
                  itemBuilder: (context, index) {
                    final activity = _activities[_selectedRoutine]![index];
                    return Card(
                      color: activity['color'],
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(
                          activity['name'],
                          style: TextStyle(
                            color: activity['isCompleted']
                                ? Colors.grey
                                : Colors.black,
                            decoration: activity['isCompleted']
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        subtitle: Text(
                          activity['description'],
                          style: const TextStyle(color: Colors.black54),
                        ),
                        leading: Checkbox(
                          value: activity['isCompleted'],
                          onChanged: (bool? value) {
                            if (mounted) {
                              setState(() {
                                activity['isCompleted'] = value ?? false;
                              });
                            }
                          },
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            if (mounted) {
                              setState(() {
                                _activities[_selectedRoutine]!.removeAt(index);
                                _activities['All']!.removeAt(index);
                              });
                            }
                          },
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildChoiceChip(String label) {
    return ChoiceChip(
      label: Text(label),
      selected: _selectedRoutine == label,
      onSelected: (bool selected) {
        if (mounted) {
          setState(() {
            _selectedRoutine = label;
          });
        }
      },
    );
  }
}
