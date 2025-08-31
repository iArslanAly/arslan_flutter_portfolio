import 'package:flutter/material.dart';

import '../../core/widgets/desktop_appbar.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesktopAppBar(onCTAPressed: () {}, onNavTogglePressed: () {}),
      body: Center(child: Text('Portfolio Page Content')),
    );
  }
}
