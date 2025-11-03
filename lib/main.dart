import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const MyProfileApp());
}

class MyProfileApp extends StatefulWidget {
  const MyProfileApp({super.key});

  @override
  State<MyProfileApp> createState() => _MyProfileAppState();
}

class _MyProfileAppState extends State<MyProfileApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.teal,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: WelcomeScreen(
        onThemeToggle: () {
          setState(() => _isDarkMode = !_isDarkMode);
        },
        isDarkMode: _isDarkMode,
      ),
    );
  }
}
