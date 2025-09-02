import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/images.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.heroDesktop,
      width: MediaQuery.of(context).size.width >= 1440 ? 0.35.sw : 0.6.sw,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.low,
    );
  }
}
