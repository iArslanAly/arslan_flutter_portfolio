import 'package:arslan_flutter_portfolio/core/widgets/desktop_appbar.dart';
import 'package:arslan_flutter_portfolio/presentation/widgets/homeSecctions/hero.dart';
import 'package:arslan_flutter_portfolio/presentation/widgets/news_ticker.dart';
import 'package:flutter/material.dart';

import '../widgets/homeSecctions/introduction/introduction.dart';
import '../widgets/homeSecctions/service.dart';

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
          ],
        ),
      ),
    );
  }
}
