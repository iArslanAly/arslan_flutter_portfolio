import 'package:arslan_flutter_portfolio/core/widgets/desktop_appbar.dart';
import 'package:arslan_flutter_portfolio/presentation/widgets/homeSecctions/hero/hero.dart';
import 'package:arslan_flutter_portfolio/presentation/widgets/homeSecctions/resumeSection/resume_section.dart';
import 'package:arslan_flutter_portfolio/presentation/widgets/homeSecctions/work/work.dart';
import 'package:arslan_flutter_portfolio/presentation/widgets/news_ticker.dart';
import 'package:flutter/material.dart';

import '../../widgets/homeSecctions/introduction/introduction.dart';
import '../../widgets/homeSecctions/serviceSection/service.dart';

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
