import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:arslan_flutter_portfolio/core/constants/images.dart';
import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:arslan_flutter_portfolio/core/constants/text_strings.dart';
import 'package:arslan_flutter_portfolio/core/cubits/resume_tab_cubit.dart';
import 'package:arslan_flutter_portfolio/core/widgets/cta.dart';
import 'package:arslan_flutter_portfolio/presentation/widgets/homeSecctions/resumeSection/about_me.dart';
import 'package:arslan_flutter_portfolio/presentation/widgets/homeSecctions/resumeSection/education.dart';
import 'package:arslan_flutter_portfolio/presentation/widgets/homeSecctions/resumeSection/experience.dart';
import 'package:arslan_flutter_portfolio/presentation/widgets/homeSecctions/resumeSection/skills.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResumeSection extends StatelessWidget {
  const ResumeSection({super.key});

  final List<String> tabs = const [
    'About Me',
    'Experience',
    'Education',
    'Skills',
  ];

  Widget _buildTabContent(int index) {
    switch (index) {
      case 0:
        return AboutMe();
      case 1:
        return Experience();
      case 2:
        return Education();
      case 3:
        return Skills();
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 80.0.h, horizontal: 80.0.w),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.resumeBg),
          fit: BoxFit.cover,
          filterQuality: FilterQuality.low,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// CTA Section (left)
          SizedBox(
            width: AppSizes.d415.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TextStrings.resumeLabel.toUpperCase(),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontSize: AppSizes.d20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: AppSizes.d16.h),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: TextStrings.resumeTitle1,
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              fontSize: AppSizes.d48.sp,
                              color: AppColors.textPrimary,
                              height: 1,
                            ),
                        children: [
                          TextSpan(
                            text: TextStrings.resumeTitle2,
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  fontSize: AppSizes.d48.sp,
                                  color: AppColors.primary,
                                  height: 1,
                                ),
                          ),
                          TextSpan(
                            text: TextStrings.resumeTitle3,
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  fontSize: AppSizes.d48.sp,
                                  color: AppColors.textPrimary,
                                  height: 1,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSizes.d44.h),

                /// CTA buttons with Cubit
                BlocBuilder<ResumeTabCubit, int>(
                  builder: (context, selectedIndex) {
                    return Column(
                      children: List.generate(tabs.length, (index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: AppSizes.d16.h),
                          child: SizedBox(
                            height: AppSizes.d60.h,
                            child: CTA(
                              label: tabs[index],
                              onPressed: () {
                                context.read<ResumeTabCubit>().selectTab(index);
                              },
                              isSelected: index == selectedIndex,
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
              ],
            ),
          ),

          SizedBox(width: 40.w),

          /// Content Section (right)
          Expanded(
            child: BlocBuilder<ResumeTabCubit, int>(
              builder: (context, selectedIndex) {
                return Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: _buildTabContent(selectedIndex),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
