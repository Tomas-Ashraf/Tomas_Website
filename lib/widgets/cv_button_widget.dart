import 'package:flutter/material.dart';
import 'package:tomas_website/services/get_resume_service.dart';
import 'package:url_launcher/url_launcher.dart';

class CvButtonWidget extends StatelessWidget {
  const CvButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String? resumeUrl;

    return Container(
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
      child: ElevatedButton(
        onPressed: () async {
          print('Cv Button Tapped');
          resumeUrl = await GetResumeLink().getResumeUrl();
          Uri uri = Uri.parse('$resumeUrl');
          await launchUrl(uri, webOnlyWindowName: '_blank');
        },
        child: const Text("Download CV"),
      ),
    );
  }
}
