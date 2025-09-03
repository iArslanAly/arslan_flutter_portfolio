import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeRepository {
  Future<void> launchAppUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('❌ Could not launch $url');
    }
  }

  Future<void> openCv() async {
    // When hosted on Firebase, this will be served as a static file
    const cvPath =
        'https://firebasestorage.googleapis.com/v0/b/portfolio-c17b5.firebasestorage.app/o/cv%2FArslan_Ali_CV_Flutter%20Dev.pdf?alt=media&token=e4f11102-27cb-47f4-a319-2be05ce439e8';

    // In Firebase hosting, asset URLs are relative
    final Uri uri = Uri.parse(cvPath);

    if (!await launchUrl(
      uri,
      mode: kIsWeb
          ? LaunchMode
                .externalApplication // new tab in browser
          : LaunchMode.platformDefault, // mobile/desktop default handler
    )) {}
  }
}
