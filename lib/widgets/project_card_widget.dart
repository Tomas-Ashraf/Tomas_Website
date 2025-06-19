// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:tomas_website/models/project_model.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({super.key, required this.projectModel});
  final ProjectModel projectModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: 300,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade900,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            projectModel.projectName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(projectModel.projectSubtitle),
          const SizedBox(height: 8),
          Container(
            width: 250,
            height: 100,
            child: Image.network(
              projectModel.projectImage,
            ),
          ),
          const SizedBox(height: 8),

          Wrap(
            spacing: 8,
            children:
                projectModel.techStack
                    .map((tech) => Chip(label: Text(tech)))
                    .toList(),
          ),
        ],
      ),
    );
  }
}
