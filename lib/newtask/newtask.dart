import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: const Text('New Task'),
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
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
                        Text('New Task',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        Text('Click to change the emoji',
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name your new task',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Describe it',
                      border: OutlineInputBorder(),
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
                        label: const Text('Daily'),
                        selected: repeatCycle == 'Daily',
                        onSelected: (bool selected) {
                          setState(() {
                            repeatCycle = 'Daily';
                          });
                        },
                      ),
                      ChoiceChip(
                        label: const Text('Weekly'),
                        selected: repeatCycle == 'Weekly',
                        onSelected: (bool selected) {
                          setState(() {
                            repeatCycle = 'Weekly';
                          });
                        },
                      ),
                      ChoiceChip(
                        label: const Text('Monthly'),
                        selected: repeatCycle == 'Monthly',
                        onSelected: (bool selected) {
                          setState(() {
                            repeatCycle = 'Monthly';
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: tagController,
                    decoration: const InputDecoration(
                      labelText: 'Set a tag for your task',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 16.0),
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String description = descriptionController.text;
                String tag = tagController.text;

                if (name.isNotEmpty && tag.isNotEmpty) {
                  Navigator.pop(context, {
                    'name': name,
                    'description': description, // Kirim deskripsi
                    'tag': tag,
                    'color': selectedColor.value, // Kirim nilai warna
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
                backgroundColor: Colors.lightBlueAccent,
              ),
              child: const Text(
                '    ',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
