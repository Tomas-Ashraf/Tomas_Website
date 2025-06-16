// ignore_for_file: unused_local_variable, unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tomas_website/widgets/header_section.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tomas Ashraf | Flutter Developer',
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white70),
          headlineMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF5e7a89), Color(0xFF030f42)],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const HeaderSection().animate().fade().slideY(),
                const SizedBox(height: 48),
                const ProjectsSection().animate().fade(duration: 600.ms),
                const SizedBox(height: 48),
                const AboutSection().animate().fade(duration: 600.ms),
                const SizedBox(height: 48),
                const ContactSection().animate().fade(duration: 600.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Projects', style: TextStyle(fontSize: 28)),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          direction: isMobile ? Axis.vertical : Axis.horizontal,
          children: [
            _projectCard('Project A', 'A Flutter app for ecommerce.', [
              'Flutter',
              'Firebase',
            ]),
            _projectCard('Project B', 'A responsive portfolio website.', [
              'Flutter Web',
            ]),
          ],
        ),
      ],
    );
  }

  Widget _projectCard(
    String title,
    String description,
    List<String> techStack,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: 300,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade900,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(description),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: techStack.map((tech) => Chip(label: Text(tech))).toList(),
          ),
        ],
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'About Me\n\nI\'m a passionate Flutter developer with a strong background in software engineering. I enjoy building beautiful, scalable apps and working on UI/UX challenges.\n',
      style: TextStyle(fontSize: 16),
    );
  }
}

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  String name = '', email = '', message = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Contact Me', style: TextStyle(fontSize: 28)),
        const SizedBox(height: 12),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  filled: true,
                  fillColor: Colors.white10,
                ),
                onSaved: (value) => name = value ?? '',
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: Colors.white10,
                ),
                onSaved: (value) => email = value ?? '',
              ),
              const SizedBox(height: 12),
              TextFormField(
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Message',
                  filled: true,
                  fillColor: Colors.white10,
                ),
                onSaved: (value) => message = value ?? '',
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState?.save();
                  // Add send logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Message sent! (Dummy logic)"),
                    ),
                  );
                },
                child: const Text("Send Message"),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Text('Email: tomas.dev@example.com'),
        const Text('LinkedIn: linkedin.com/in/tomas-ashraf'),
        const Text('GitHub: github.com/tomas-ashraf'),
      ],
    );
  }
}
