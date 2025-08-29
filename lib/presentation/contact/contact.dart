import 'package:flutter/material.dart';

import '../../core/widgets/desktop_appbar.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesktopAppBar(onCTAPressed: () {}, onNavTogglePressed: () {}),
      body: const Center(child: Text('Contact Page Content')),
    );
  }
}
