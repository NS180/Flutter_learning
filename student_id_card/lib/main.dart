import 'package:flutter/material.dart';

void main() {
  runApp(const StudentIdApp());
}

class StudentIdApp extends StatelessWidget {
  const StudentIdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student ID Card',
      home: Scaffold(
        backgroundColor: const Color(0xFFEBF2FF),
        appBar: AppBar(
          title: const Text(
            'Student ID Card',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xFF1E65DF),
          elevation: 0,
        ),
        body: Center(
          child: Container(
            width: 280,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFF1E65DF),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color(0xFFD4E3FF),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 60,
                    color: Color(0xFF1E65DF),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Nandini Sharma',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'B.Tech CSE',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF1E65DF),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Roll No: 29',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}