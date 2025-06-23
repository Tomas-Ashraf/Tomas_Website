// ignore_for_file: unused_local_variable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:tomas_website/models/project_model.dart';

class ProjectDetails extends StatelessWidget {
  const ProjectDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final projectModel =
        ModalRoute.of(context)!.settings.arguments as ProjectModel;
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/5166950.jpg'),
            fit: BoxFit.cover,
          ),
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [Color(0xFF5e7a89), Color(0xFF030f42)],
          // ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  projectModel.projectName,
                  style: TextStyle(
                    fontSize: isMobile ? 30 : 38,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'RushDriver_Italic',
                    color: Color(0xffa35bf7),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 1 / 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 10),

                          Text(
                            projectModel.projectSubtitle,
                            style: TextStyle(fontSize: 16),
                          ),

                          SizedBox(height: 15),
                          Text(
                            'Project description',
                            style: TextStyle(
                              fontSize: isMobile ? 20 : 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),

                          Text(
                            projectModel.projectDescription,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 15),

                          Text(
                            'Skills and deliverables',
                            style: TextStyle(
                              fontSize: isMobile ? 20 : 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),

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
                        ],
                      ),
                    ),

                    Container(
                      height:
                          MediaQuery.of(
                            context,
                          ).size.height, // adjust height as needed
                      child: VerticalDivider(
                        color: Colors.white,
                        thickness: 1,
                        width: 20, // spacing between columns
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Video 1'),
                          Text('Video 2'),
                          Text('Video 3'),
                          Text('Video 4'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
