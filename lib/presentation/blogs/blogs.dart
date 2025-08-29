import 'package:flutter/material.dart';

import '../../core/widgets/desktop_appbar.dart';

class BlogsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesktopAppBar(onCTAPressed: () {}, onNavTogglePressed: () {}),
      body: Center(child: Text('List of Blogs will be displayed here.')),
    );
  }
}
