import 'package:flutter/material.dart';
import 'package:project_mobprog_uas/home/home_screen.dart';

class NewTaskPage extends StatefulWidget {
  const NewTaskPage({super.key});

  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  Color selectedColor = Colors.lightGreenAccent;
  String repeatCycle = 'Daily';
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController tagController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FF),
      appBar: AppBar(
        title: const Text(
          'New Task',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xFFEEE5FF),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Column(
                      children: [
                        Icon(Icons.star, size: 50, color: Colors.yellow),
                        Text(
                          'New Task',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Click to change the emoji',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name your new task',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Describe it',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 20),
                  const Text('Card Color'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var color in [
                        Colors.lightGreenAccent,
                        Colors.orangeAccent,
                        Colors.lightBlue,
                        Colors.red,
                        Colors.yellow,
                        Colors.purple,
                        Colors.pink
                      ])
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColor = color;
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: color,
                            child: selectedColor == color
                                ? const Icon(Icons.check, color: Colors.white)
                                : null,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text('Repeat'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ChoiceChip(
                        label: const Text('All'),
                        selected: repeatCycle == 'All',
                        onSelected: (bool selected) {
                          setState(() {
                            repeatCycle = 'All';
                          });
                        },
                        selectedColor: const Color(0xFFEEE5FF),
                      ),
                      // ChoiceChip(
                      //   label: const Text('Weekly'),
                      //   selected: repeatCycle == 'Weekly',
                      //   onSelected: (bool selected) {
                      //     setState(() {
                      //       repeatCycle = 'Weekly';
                      //     });
                      //   },
                      //   selectedColor: const Color(0xFFEEE5FF),
                      // ),
                      // ChoiceChip(
                      //   label: const Text('Monthly'),
                      //   selected: repeatCycle == 'Monthly',
                      //   onSelected: (bool selected) {
                      //     setState(() {
                      //       repeatCycle = 'Monthly';
                      //     });
                      //   },
                      //   selectedColor: const Color(0xFFEEE5FF),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: tagController,
                    decoration: InputDecoration(
                      labelText: 'Set a tag for your task',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String description = descriptionController.text;
                String tag = tagController.text;

                if (name.isNotEmpty && tag.isNotEmpty) {
                  // Kirim data task ke HomeScreen
                  Navigator.pop(context, {
                    'name': name,
                    'description': description,
                    'color': selectedColor,
                    'isCompleted': false,
                    'tag': tag,
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill out the task name and tag.'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7F56D9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 24.0,
                ),
              ),
              child: const Text(
                'Add Task',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
