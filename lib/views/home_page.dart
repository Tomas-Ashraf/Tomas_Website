// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tomas_website/main.dart';
import 'package:tomas_website/widgets/header_section.dart';
import 'package:tomas_website/widgets/projects_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/4884273.jpg'),
            fit: BoxFit.cover,
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
