// ignore_for_file: unused_local_variable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:tomas_website/models/project_model.dart';
import 'package:tomas_website/services/get_projects_service.dart';
import 'package:tomas_website/widgets/project_card_widget.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 400;
    return FutureBuilder(
      future: GetProjectsService().getProjects(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show loading spinner while waiting
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // In case of error
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          // No data obtained
          return Center(child: Text('No projects found'));
        } else {
          List<ProjectModel> projectList = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Projects', style: TextStyle(fontSize: 28)),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                children: List.generate(projectList.length, (index) {
                  return ProjectCardWidget(
                    projectModel: ProjectModel(
                      projectList[index].projectDescription,
                      projectName: projectList[index].projectName,
                      projectSubtitle: projectList[index].projectSubtitle,
                      techStack: projectList[index].techStack,
                      projectImage: projectList[index].projectImage,
                    ),
                  );
                }),
              ),
            ],
          );
        }
      },
    );
  }
}
