import 'package:flutter/material.dart';
import 'package:tomas_website/services/get_resume_service.dart';
import 'package:url_launcher/url_launcher.dart';

class CvButtonWidget extends StatelessWidget {
  const CvButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String? resumeUrl;

    return         ElevatedButton(
          onPressed: () async {
            print('Cv Button Tapped');
            resumeUrl = await GetResumeLink().getResumeUrl();
            Uri uri = Uri.parse('$resumeUrl');
            await launchUrl(uri, webOnlyWindowName: '_blank');
          },
          child: const Text("Download CV"),
        );
  }
}