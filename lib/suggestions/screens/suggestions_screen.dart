import 'package:flutter/material.dart';
import 'category_detail_screen.dart';
import 'all_activities_screen.dart';
import '../widgets/activity_card.dart';
import '../widgets/section_header.dart';

class SuggestionsPage extends StatelessWidget {
  const SuggestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suggestions'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Section 1: Learn and Study More
          SectionHeader(
            title: "Learn and Study More",
            onSeeAll: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AllActivitiesScreen(
                    category: "Learn and Study More",
                    activities: ["Read", "Study"],
                    color: Colors.yellow,
                  ),
                ),
              );
            },
          ),
          ActivityCard(
            title: "Read",
            description: "Stay hungry for knowledge.",
            color: Colors.yellow,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CategoryDetailScreen(
                    activityName: "Read",
                    details: [
                      "Read 10 pages",
                      "Summarize your reading",
                      "Explore new genres"
                    ],
                    color: Colors.yellow,
                  ),
                ),
              );
            },
          ),
          ActivityCard(
            title: "Study",
            description: "Prepare to be your best version.",
            color: Colors.green,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CategoryDetailScreen(
                    activityName: "Study",
                    details: [
                      "Review notes",
                      "Take practice tests",
                      "Watch tutorials"
                    ],
                    color: Colors.green,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),

          // Section 2: Exercise
          SectionHeader(
            title: "Exercise",
            onSeeAll: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AllActivitiesScreen(
                    category: "Exercise",
                    activities: ["Running", "Cycling"],
                    color: Colors.blue,
                  ),
                ),
              );
            },
          ),
          ActivityCard(
            title: "Running",
            description: "Become your best version.",
            color: Colors.blue,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CategoryDetailScreen(
                    activityName: "Running",
                    details: [
                      "Morning runs",
                      "Interval training",
                      "Stretch after runs"
                    ],
                    color: Colors.blue,
                  ),
                ),
              );
            },
          ),
          ActivityCard(
            title: "Cycling",
            description: "Enjoy a relaxing ride.",
            color: Colors.pink,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CategoryDetailScreen(
                    activityName: "Cycling",
                    details: [
                      "Park rides",
                      "Long-distance cycling",
                      "Track routes"
                    ],
                    color: Colors.pink,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),

          // Section 3: Clean and Organize
          SectionHeader(
            title: "Clean and Organize",
            onSeeAll: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AllActivitiesScreen(
                    category: "Clean and Organize",
                    activities: ["Mop the house", "Clean the bathroom"],
                    color: Colors.purple,
                  ),
                ),
              );
            },
          ),
          ActivityCard(
            title: "Mop the house",
            description: "Get your life together.",
            color: Colors.yellow,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CategoryDetailScreen(
                    activityName: "Mop the house",
                    details: [
                      "Vacuum first",
                      "Use scented cleaner",
                      "Dry floors"
                    ],
                    color: Colors.yellow,
                  ),
                ),
              );
            },
          ),
          ActivityCard(
            title: "Clean the bathroom",
            description: "Keep it spotless.",
            color: Colors.purple,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CategoryDetailScreen(
                    activityName: "Clean the bathroom",
                    details: [
                      "Scrub tiles",
                      "Clean the sink",
                      "Replace towels"
                    ],
                    color: Colors.purple,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
