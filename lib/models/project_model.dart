class ProjectModel {
  String projectName;
  String projectSubtitle;
  String? projectDescription;
  List<dynamic> techStack;
  String projectImage;
  String? projectVideos;
  int? projectOrder;

  ProjectModel({
    required this.projectName,
    required this.projectSubtitle,
    this.projectDescription,
    required this.techStack,
    required this.projectImage,
    this.projectVideos,
    this.projectOrder,
  });
}
