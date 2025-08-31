import 'package:flutter/material.dart';

import '../../core/widgets/desktop_appbar.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesktopAppBar(onCTAPressed: () {}, onNavTogglePressed: () {}),
      body: const Center(child: Text('About Page')),
    );
  }
}
