import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:arslan_flutter_portfolio/presentation/widgets/homeSecctions/work/work_slider.dart';
import 'package:arslan_flutter_portfolio/presentation/widgets/homeSecctions/work/work_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkSection extends StatelessWidget {
  const WorkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.onPrimary,
      child: Column(
        children: [
          WorkTitle(),
          WorkSlider(),
          SizedBox(height: 80.h),
        ],
      ),
    );
  }
}
