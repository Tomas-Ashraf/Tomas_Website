// ignore_for_file: unused_local_variable, unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tomas_website/services/get_projects_service.dart';
import 'package:tomas_website/views/home_page.dart';
import 'package:tomas_website/views/project_details.dart';
import 'package:tomas_website/widgets/header_section.dart';
import 'package:tomas_website/widgets/projects_section.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const TomasWebSite());
}

class TomasWebSite extends StatefulWidget {
  const TomasWebSite({super.key});

  @override
  State<TomasWebSite> createState() => _TomasWebSiteState();
}

class _TomasWebSiteState extends State<TomasWebSite> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tomas Ashraf | Flutter Developer',
      theme: ThemeData.dark().copyWith(
        
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xFFf1f1f3)),
          headlineMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const HomePage(),
      initialRoute: 'HomePage',
      routes: {
        'HomePage': (context) => const HomePage(),
        'ProjectDetails': (context) => const ProjectDetails(),
      },
      debugShowCheckedModeBanner: false,
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
        const Text('Email: tomasashraf70@gmail.com'),
        const Text(
          'LinkedIn: https://www.linkedin.com/in/tomas-ashraf-adly-72659a1b5/',
        ),
        const Text('GitHub: https://github.com/Tomas-Ashraf'),
      ],
    );
  }
}
