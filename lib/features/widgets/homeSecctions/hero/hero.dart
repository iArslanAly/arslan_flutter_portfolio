import 'package:arslan_flutter_portfolio/features/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arslan_flutter_portfolio/core/constants/images.dart';

import 'hero_text.dart';
import 'hero_image.dart';

class AppHero extends StatelessWidget {
  const AppHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.heroBackgroundDesktop),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.low,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 90.w, vertical: 60.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: HeroText()),
              SizedBox(width: 40.w),
              HeroImage(),
            ],
          ),
        ),
      ),
      mobile: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.heroBackgroundDesktop),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.low,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeroText(),
              SizedBox(height: 30.h),
              HeroImage(),
            ],
          ),
        ),
      ),
    );
  }
}
