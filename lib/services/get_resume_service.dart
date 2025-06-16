import 'package:cloud_firestore/cloud_firestore.dart';

class GetResumeLink {
  String? resumeUrl;
  Future<String?> getResumeUrl() async {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance
            .collection('links')
            .doc('resume_link')
            .get();
    if (doc.exists) {
      resumeUrl = doc['url'];
    } else {
      print('Document does not exist');
    }
    return resumeUrl;
  }
}
