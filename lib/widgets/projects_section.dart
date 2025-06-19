import 'package:flutter/material.dart';
import 'package:tomas_website/models/project_model.dart';
import 'package:tomas_website/widgets/project_card_widget.dart';

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
            ProjectCardWidget(
              projectModel: ProjectModel(
                projectName: 'Project A',
                projectSubtitle: 'A Flutter app for ecommerce.',
                techStack: ['Flutter', 'Firebase'],
                projectImage:
                    'https://img.lovepik.com/element/45011/0956.png_860.png',
              ),
            ),

            ProjectCardWidget(
              projectModel: ProjectModel(
                projectName: 'Project B',
                projectSubtitle: 'A responsive portfolio website.',
                techStack: ['Flutter Web'],
                projectImage:
                    'https://png.pngtree.com/png-vector/20190525/ourmid/pngtree-informationcontentdevelopmentwebsiteweb-flat-icon--green-png-image_1067577.jpg',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
