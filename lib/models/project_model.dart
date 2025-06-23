class ProjectModel {
  String? id;
  String projectName;
  String projectSubtitle;
  String projectDescription;
  List<dynamic> techStack;
  String projectImage;
  String? projectVideos;
  int? projectOrder;

  ProjectModel(
    this.projectDescription, {
    this.id,
    required this.projectName,
    required this.projectSubtitle,
    required this.techStack,
    required this.projectImage,
    this.projectVideos,
    this.projectOrder,
  });
}
