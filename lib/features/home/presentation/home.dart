import 'package:flutter/material.dart';

import '../../../core/widgets/desktop_appbar.dart';
import '../../widgets/homeSecctions/hero/hero.dart';
import '../../widgets/homeSecctions/introduction/introduction.dart';
import '../../widgets/homeSecctions/resumeSection/resume_section.dart';
import '../../widgets/homeSecctions/serviceSection/service.dart';
import '../../widgets/homeSecctions/work/work.dart';
import '../../widgets/news_ticker.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesktopAppBar(onCTAPressed: () {}, onNavTogglePressed: () {}),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppHero(),
            ServiceSection(),
            IntroductionSection(),
            NewsTickerBanner(),
            ResumeSection(),
            WorkSection(),
          ],
        ),
      ),
    );
  }
}
