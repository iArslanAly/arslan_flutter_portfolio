import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/app_drawer.dart';
import '../../core/widgets/desktop_appbar.dart';
import '../../core/widgets/mobile_appbar.dart';

class BlogsPage extends StatelessWidget {
  const BlogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.isDesktop;
    return Scaffold(
      appBar: isDesktop
          ? DesktopAppBar(onNavTogglePressed: () {})
          : MobileAppBar(),
      endDrawer: isDesktop ? null : const MobileDrawer(),
      body: Center(child: Text('List of Blogs will be displayed here.')),
    );
  }
}
