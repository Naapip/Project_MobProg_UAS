import 'package:flutter/material.dart';
import 'package:project_mobprog_uas/home/fl_chart.dart';
import 'package:project_mobprog_uas/profile/profile.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:project_mobprog_uas/suggestions/screens/suggestions_screen.dart';
import 'package:project_mobprog_uas/newtask/newtask.dart'; // Halaman NewTask

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String _selectedRoutine = 'All';
  int _currentIndex = 0;

  // Data aktivitas berdasarkan kategori
  Map<String, List<Map<String, dynamic>>> _activities = {
    'Daily Routine': [],
    'Study Routine': [],
    'All': [],
  };

  // Daftar judul untuk BottomNavigationBar
  final List<String> _titles = ["Today", "Analytics", "Profile"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEEE5FF),
        elevation: 0,
        title: Text(
          _titles[_currentIndex],
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: _currentIndex == 0
          ? _buildHomeContent()
          : _currentIndex == 1
              ? AnalyticsScreen()
              : ProfilePage(
                  name: "User Name",
                  email: "user@example.com",
                ),
      floatingActionButton: _currentIndex == 0
          ? Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: FloatingActionButton(
                onPressed: () async {
                  // Pilih antara NewTask atau Suggestions
                  final action = await _showActionDialog(context);

                  if (action != null) {
                    if (action == 'NewTask') {
                      final newActivity = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewTaskPage()),
                      );

                      if (newActivity != null && mounted) {
                        setState(() {
                          final category = newActivity['category'] ?? 'All';
                          // Cek apakah aktivitas sudah ada sebelum ditambahkan
                          if (!_activityExists(newActivity, category)) {
                            _activities[category]!.add(newActivity);
                            // Tambahkan ke kategori "All" jika belum ada
                            if (!_activityExists(newActivity, 'All')) {
                              _activities['All']!.add(newActivity);
                            }
                          }
                        });
                      }
                    } else if (action == 'Suggestions') {
                      final newActivity = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuggestionsPage()),
                      );

                      if (newActivity != null && mounted) {
                        setState(() {
                          final category = newActivity['category'] ?? 'All';
                          // Cek apakah aktivitas sudah ada sebelum ditambahkan
                          if (!_activityExists(newActivity, category)) {
                            _activities[category]!.add(newActivity);
                            // Tambahkan ke kategori "All" jika belum ada
                            if (!_activityExists(newActivity, 'All')) {
                              _activities['All']!.add(newActivity);
                            }
                          }
                        });
                      }
                    }
                  }
                },
                child: const Icon(Icons.add),
                backgroundColor: const Color(0xFF7F56D9),
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: const Color(0xFFF8F8FF),
        selectedItemColor: const Color(0xFF7F56D9),
        unselectedItemColor: const Color(0xFFA5A5A5),
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

  // Metode untuk menampilkan dialog pilihan task
  Future<String?> _showActionDialog(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Pilih Aksi"),
          content: const Text("Di mana Anda ingin menambahkan task?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('NewTask');
              },
              child: const Text("New Task"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('Suggestions');
              },
              child: const Text("Suggestions"),
            ),
          ],
        );
      },
    );
  }

  Widget _buildHomeContent() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _calendarFormat = _calendarFormat == CalendarFormat.week
                    ? CalendarFormat.month
                    : CalendarFormat.week;
              });
            },
            child: TableCalendar(
              firstDay: DateTime.utc(2000, 1, 1),
              lastDay: DateTime.utc(2100, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarStyle: const CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Color(0xFFD1C4E9),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Color(0xFF7F56D9),
                  shape: BoxShape.circle,
                ),
              ),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildChoiceChip('All'),
            const SizedBox(width: 10),
            _buildChoiceChip('Daily Routine'),
            const SizedBox(width: 10),
            _buildChoiceChip('Study Routine'),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: _activities[_selectedRoutine]?.isEmpty ?? true
              ? const Center(
                  child: Text(
                    "Nothing here yet...",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                )
              : ListView.builder(
                  itemCount: _activities[_selectedRoutine]!.length,
                  itemBuilder: (context, index) {
                    final activity = _activities[_selectedRoutine]![index];
                    return Card(
                      color: activity['color'],
                      child: ListTile(
                        title: Text(
                          activity['name'],
                          style: TextStyle(
                            decoration: activity['isCompleted']
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        subtitle: Text(activity['description']),
                        leading: Checkbox(
                          value: activity['isCompleted'],
                          onChanged: (value) {
                            setState(() {
                              activity['isCompleted'] = value ?? false;
                            });
                          },
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              _removeActivityFromAllCategories(activity);
                            });
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
      onSelected: (selected) {
        setState(() {
          _selectedRoutine = label;
        });
      },
    );
  }

  // Fungsi untuk memeriksa apakah activity sudah ada
  bool _activityExists(Map<String, dynamic> activity, String category) {
    return _activities[category]
            ?.any((item) => item['name'] == activity['name']) ??
        false;
  }

  // Fungsi untuk menghapus task dari semua kategori
  void _removeActivityFromAllCategories(Map<String, dynamic> activity) {
    _activities.forEach((category, activitiesList) {
      activitiesList.removeWhere((item) => item['name'] == activity['name']);
    });
  }
}
