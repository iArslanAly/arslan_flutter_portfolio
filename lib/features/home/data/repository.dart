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
    const String cvPath = 'assets/files/Arslan_Ali_CV_Flutter.pdf';

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
