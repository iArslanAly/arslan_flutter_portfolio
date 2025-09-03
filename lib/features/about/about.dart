import 'package:arslan_flutter_portfolio/features/widgets/homeSecctions/introduction/introduction.dart';
import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/widgets/desktop_appbar.dart';
import '../widgets/homeSecctions/footer/footer.dart';
import '../widgets/homeSecctions/resumeSection/resume_section.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesktopAppBar( onNavTogglePressed: () {}),
      body: Container(
        color: AppColors.background,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntroductionSection(),
              ResumeSection(),

              // footer OUTSIDE padding → full width
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
