import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_mobprog_uas/home/fl_chart.dart';
import 'package:project_mobprog_uas/login/login_screen1.dart';
import 'package:project_mobprog_uas/profile/profile.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String _selectedRoutine = 'All';

  Map<String, List<Map<String, dynamic>>> _activities = {
    'Daily Routine': [],
    'Study Routine': [],
    'All': [],
  };

  int _currentIndex = 0; // Untuk mengontrol tab aktif

  // Tambahkan daftar judul sesuai tab
  final List<String> _titles = ["Today", "Analytics", "Profile"];

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FF), // Background putih terang
      appBar: AppBar(
        backgroundColor: const Color(0xFFEEE5FF), // Ungu pastel
        elevation: 0,
        title: Text(
          _titles[_currentIndex], // Judul berubah sesuai tab
          style: const TextStyle(color: Colors.black), // Hitam untuk kontras
        ),
        centerTitle: true,
        actions: [
          if (_currentIndex == 0) // Tampilkan logout hanya di tab Today
            IconButton(
              icon: const Icon(Icons.logout,
                  color: Color(0xFF7F56D9)), // Ungu lebih gelap
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
              ? AnalyticsScreen() // Ganti konten ke Analytics
              : ProfilePage(
                  name: user?.displayName ?? "Unknown User",
                  email: user?.email ?? "No email provided",
                ), // Ganti konten ke Profile
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: const Color(0xFFF8F8FF), // Background putih terang
        selectedItemColor: const Color(0xFF7F56D9), // Ungu gelap
        unselectedItemColor:
            const Color(0xFFA5A5A5), // Abu-abu untuk ikon tidak aktif
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Perbarui index aktif
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
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: const Color(0xFFD1C4E9), // Ungu terang untuk hari ini
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: const Color(
                      0xFF7F56D9), // Ungu gelap untuk hari yang dipilih
                  shape: BoxShape.circle,
                ),
                defaultTextStyle: const TextStyle(color: Colors.black),
                weekendTextStyle: const TextStyle(color: Color(0xFF7F56D9)),
              ),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(color: Colors.black, fontSize: 16),
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
                    "Nothing here yet...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFFA5A5A5),
                        fontSize: 16), // Abu-abu untuk teks kosong
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
      backgroundColor: const Color(0xFFEEE5FF), // Ungu pastel
      selectedColor: const Color(0xFF7F56D9), // Ungu gelap
      labelStyle: TextStyle(
        color: _selectedRoutine == label ? Colors.white : Colors.black,
      ),
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
