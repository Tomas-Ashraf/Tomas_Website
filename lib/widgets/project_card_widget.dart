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
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors:
          //  [Colors.transparent, Color(0xFF111927)],
          [Color(0xFF1e2836), Color(0xFF111927)],
        ),
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
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 10),
              child: Text(projectModel.projectSubtitle),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 200,
            height: 100,
            child:
                projectModel.projectImage.isNotEmpty
                    ? Image.network(
                      projectModel.projectImage,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) {
                        print('Error: $error tackTrace: $stackTrace');
                        return Text('Failed to load image');
                      },
                    )
                    : Center(child: Text('No Image')),
          ),
          const SizedBox(height: 8),

          Wrap(
            spacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children:
                projectModel.techStack
                    .map(
                      (tech) => Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Chip(label: Text(tech)),
                      ),
                    )
                    .toList(),
          ),
          const SizedBox(height: 8),

          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                'ProjectDetails',
                arguments: ProjectModel(
                  projectModel.projectDescription,
                  projectName: projectModel.projectName,
                  projectSubtitle: projectModel.projectSubtitle,
                  techStack: projectModel.techStack,
                  projectImage: projectModel.projectImage,
                  projectVideos: projectModel.projectVideos,
                ),
              );
            },
            child: Text('Project Details'),
          ),
        ],
      ),
    );
  }
}
