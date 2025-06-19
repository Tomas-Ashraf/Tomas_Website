class ProjectModel {
  final String projectName;
  final String projectSubtitle;
  final String? projectDescription;
  final List<String> techStack;
  final String projectImage;
  final String? projectVideos;

  ProjectModel({
    required this.projectName,
    required this.projectSubtitle,
    this.projectDescription,
    required this.techStack,
    required this.projectImage,
    this.projectVideos,
  });
}
