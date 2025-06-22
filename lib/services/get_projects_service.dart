// ignore_for_file: avoid_function_literals_in_foreach_calls, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tomas_website/models/project_model.dart';

class GetProjectsService {
  Future<List<ProjectModel>> getProjects() async {
    List<ProjectModel> projectsList = [];

    await FirebaseFirestore.instance
        .collection('projects')
        .orderBy('project_order')
        .get()
        .then((QuerySnapshot querySnapshot) {
          try {
            for (var doc in querySnapshot.docs) {
              projectsList.add(
                ProjectModel(
                  projectName: doc['project_name'].toString(),
                  projectSubtitle: doc['project_subtitle'].toString(),
                  techStack: List<String>.from(doc['project_techstack']),
                  projectImage: doc['project_image'].toString(),
                  projectOrder: doc['project_order'],
                  projectDescription: doc['project_description'].toString(),
                  projectVideos: doc['project_videos'].toString(),
                ),
              );
            }
          } on Exception catch (e) {
            print('Error: $e');
          }
        });

    return projectsList;
  }
}
