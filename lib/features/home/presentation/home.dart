import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/desktop_appbar.dart';
import '../../widgets/homeSecctions/blogSection/blog_section.dart';
import '../../widgets/homeSecctions/contactSection/contact_section.dart';
import '../../widgets/homeSecctions/footer/footer.dart';
import '../../widgets/homeSecctions/hero/hero.dart';
import '../../widgets/homeSecctions/introduction/introduction.dart';
import '../../widgets/homeSecctions/resumeSection/resume_section.dart';
import '../../widgets/homeSecctions/serviceSection/service.dart';
import '../../widgets/homeSecctions/testimonialSection/testimonial.dart';
import '../../widgets/homeSecctions/work/work.dart';
import '../../widgets/news_ticker.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesktopAppBar( onNavTogglePressed: () {}),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppHero(),
            ServiceSection(),
            IntroductionSection(),
            NewsTickerBanner(),
            ResumeSection(),
            WorkSection(),
            TestimonialSection(),
            BlogSection(),
            ContectSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
