import 'package:flutter/material.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Education',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const ListTile(
            leading: Icon(Icons.school),
            title: Text('BS in Computer Science - Karakoram International University'),
            subtitle: Text('2020 - 2024'),
          ),
          const ListTile(
            leading: Icon(Icons.workspace_premium),
            title: Text('Certified Flutter Developer'),
            subtitle: Text('Google / Udemy'),
          ),
          const Divider(),
          const Text(
            'Skills',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          skillBar('Flutter', 0.9),
          skillBar('Python', 0.85),
          skillBar('Machine Learning', 0.8),
          skillBar('SQL', 0.75),
          skillBar('ReactJS', 0.70),
          skillBar('JavaScript', 0.85),
          const Divider(),const Text(
            'Hobbies',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Wrap(
            spacing: 10,
            children: [
              Chip(label: Text('🎵 Music')),
              Chip(label: Text('💻 Coding')),
              Chip(label: Text('📖 Reading')),
              Chip(label: Text('🗻 Hiking')),
              Chip(label: Text('🤖 Machine Learning')),
            ],
          ),
          const Divider(),
          const Text(
            'Achievements',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, height: 2),
          ),
          AnimatedCrossFade(
            firstChild: const Text('Tap "Show More" to read details...'),
            secondChild: const Text(
                '🏆 Winner of Flutter Hackathon 2024\n🌐 Built a full-stack AI app for real-time emotion recognition\n🎓 Conducted workshops on app development'),
            crossFadeState: showMore
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
          TextButton(
            onPressed: () => setState(() => showMore = !showMore),
            child: Text(showMore ? 'Show Less' : 'Show More'),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back to Profile'),
            ),
          ),
        ],
      ),
    );
  }

  Widget skillBar(String skill, double level) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(skill, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: level,
            backgroundColor: Colors.grey[300],
            color: Colors.teal,
            minHeight: 8,
          ),
        ],
      ),
    );
  }
}
