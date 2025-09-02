import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:arslan_flutter_portfolio/core/constants/images.dart';
import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:arslan_flutter_portfolio/core/constants/text_strings.dart';
import 'package:arslan_flutter_portfolio/core/cubits/resume_tab_cubit.dart';
import 'package:arslan_flutter_portfolio/core/widgets/cta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'about_me.dart';
import 'education.dart';
import 'experience.dart';
import 'skills.dart';

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
        return const AboutMe();
      case 1:
        return const Experience();
      case 2:
        return const Education();
      case 3:
        return const Skills();
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: context.isDesktop ? 80.h : 24.h,
        horizontal: context.isDesktop ? 80.w : 16.w,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.resumeBg),
          fit: BoxFit.cover,
          filterQuality: FilterQuality.low,
        ),
      ),
      child: context.isDesktop
          ? _buildDesktopLayout(context)
          : _buildMobileLayout(context),
    );
  }

  /// ✅ Desktop layout: Tabs on left, content on right
  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: AppSizes.d415.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              SizedBox(height: AppSizes.d44.h),
              BlocBuilder<ResumeTabCubit, int?>(
                builder: (context, selectedIndex) {
                  return Column(
                    children: List.generate(tabs.length, (index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: AppSizes.d16.h),
                        child: CTA(
                          label: tabs[index],
                          onPressed: () => context
                              .read<ResumeTabCubit>()
                              .selectTab(index, isDesktop: true),
                          isSelected: index == selectedIndex,
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
        Expanded(
          child: BlocBuilder<ResumeTabCubit, int?>(
            builder: (context, selectedIndex) {
              return Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: _buildTabContent(selectedIndex ?? 0),
              );
            },
          ),
        ),
      ],
    );
  }

  /// ✅ Mobile layout: Accordion (expand/collapse)
  Widget _buildMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(context),
          SizedBox(height: 24.h),
          BlocBuilder<ResumeTabCubit, int?>(
            builder: (context, selectedIndex) {
              return Column(
                children: List.generate(tabs.length, (index) {
                  final isExpanded = index == selectedIndex;

                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: 16.h,
                    ), // 👈 space between buttons
                    child: Column(
                      children: [
                        CTA(
                          label: tabs[index],
                          showExpandIcon: true,
                          isExpanded: isExpanded,
                          onPressed: () => context
                              .read<ResumeTabCubit>()
                              .selectTab(index, isDesktop: false),
                          isSelected: isExpanded,
                        ),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: isExpanded
                              ? Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(top: 12.h),
                                  padding: EdgeInsets.all(16.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: _buildTabContent(index),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }

  /// ✅ Common Header
  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TextStrings.resumeLabel.toUpperCase(),
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            fontSize: context.isDesktop ? AppSizes.d20.sp : AppSizes.d12.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        SizedBox(height: context.isDesktop ? AppSizes.d16.h : AppSizes.d8.h),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: TextStrings.resumeTitle1,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: context.isDesktop
                      ? AppSizes.d48.sp
                      : AppSizes.d18.sp,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
                children: [
                  TextSpan(
                    text: TextStrings.resumeTitle2,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: context.isDesktop
                          ? AppSizes.d48.sp
                          : AppSizes.d18.sp,
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  ),
                  TextSpan(
                    text: TextStrings.resumeTitle3,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: context.isDesktop
                          ? AppSizes.d48.sp
                          : AppSizes.d18.sp,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
