import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:url_launcher/url_launcher.dart';
import 'about_me_page.dart';
import '../widgets/info_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final String jsonString =
        await rootBundle.loadString('assets/data/user.json');
    final data = json.decode(jsonString);
    setState(() => userData = data);
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  void _launchEmail(String email) {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: Uri.encodeFull('subject=Hello!&body=I saw your profile app.'),
    );
    launchUrl(emailUri);
  }

  void _launchPhone(String phone) {
    final Uri phoneUri = Uri(scheme: 'tel', path: phone);
    launchUrl(phoneUri);
  }

  @override
  Widget build(BuildContext context) {
    if (userData == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: const AssetImage('assets/images/profile.jpg'),
              backgroundColor: Colors.grey[300],
            ),
            const SizedBox(height: 16),
            Text(
              userData!['name'],
              style: const TextStyle(
                  fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Text(
              userData!['profession'],
              style: const TextStyle(fontSize: 18, color: Colors.teal),
            ),
            const SizedBox(height: 10),
            Text(
              userData!['bio'],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            InfoCard(
              icon: Icons.email,
              text: userData!['email'],
              onTap: () => _launchEmail(userData!['email']),
            ),
            InfoCard(
              icon: Icons.phone,
              text: userData!['phone'],
              onTap: () => _launchPhone(userData!['phone']),
            ),
            InfoCard(
              icon: Icons.location_on,
              text: userData!['location'],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.linkedin, color: Colors.blue),
                  onPressed: () => _launchUrl(userData!['linkedin']),
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.github, color: Colors.black),
                  onPressed: () => _launchUrl(userData!['github']),
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.twitter, color: Colors.lightBlue),
                  onPressed: () => _launchUrl(userData!['twitter']),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              icon: const Icon(Icons.message),
              label: const Text("Contact Me"),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Thanks for reaching out!")),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("About Me"),
        icon: const Icon(Icons.person),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AboutMePage()),
          );
        },
      ),
    );
  }
}
