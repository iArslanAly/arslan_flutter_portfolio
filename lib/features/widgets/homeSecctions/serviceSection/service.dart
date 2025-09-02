import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:arslan_flutter_portfolio/core/constants/images.dart';
import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:arslan_flutter_portfolio/features/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/text_strings.dart';
import 'service_card_large.dart';
import 'service_cards.dart';

class ServiceSection extends StatelessWidget {
  ServiceSection({super.key});
  final List<Map<String, String>> services = [
    {'title': TextStrings.serviceTabMobile, 'icon': AppImages.mobile},
    {'title': TextStrings.serviceTabWeb, 'icon': AppImages.webDev},
    {'title': TextStrings.serviceTabUiUx, 'icon': AppImages.uiux},
    {'title': TextStrings.serviceTabFlutterFlow, 'icon': AppImages.flutterFlow},

    {
      'title': TextStrings.serviceTabAppOptimization,
      'icon': AppImages.optimization,
    },

    {'title': TextStrings.serviceTabAppStore, 'icon': AppImages.optimization},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: context.isDesktop ? AppSizes.d90.h : AppSizes.d45.h,
        horizontal: context.isDesktop ? AppSizes.d80.w : AppSizes.d16.w,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 245, 247, 246),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TextStrings.servicesLabel.toUpperCase(),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontSize: context.isDesktop
                          ? AppSizes.d20.sp
                          : AppSizes.d12.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    TextStrings.servicesTitle,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: context.isDesktop
                          ? AppSizes.d48.sp
                          : AppSizes.d18.sp,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: context.isDesktop ? AppSizes.d650.w : AppSizes.d220.w,
                child: Text(
                  TextStrings.servicesSubtitle,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: context.isDesktop
                        ? AppSizes.d16.sp
                        : AppSizes.d10.sp,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: context.isDesktop ? AppSizes.d16.h : AppSizes.d8.h),

          // Grid/Wrap Section
          Responsive(
            desktop: LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = 3;
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Grid of small cards
                    Expanded(
                      flex: 3,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: services.length,
                        padding: EdgeInsets.only(right: AppSizes.d8.w),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: AppSizes.d8.h,
                          crossAxisSpacing: AppSizes.d8.w,
                          childAspectRatio: 1.75,
                        ),
                        itemBuilder: (context, index) {
                          final service = services[index];
                          return ServiceCard(
                            title: service['title']!,
                            iconPath: service['icon']!,
                          );
                        },
                      ),
                    ),

                    // Large card
                    ServiceCardLarge(
                      title: TextStrings.serviceTabSayHello,

                      onTap: () {
                        // Handle tap
                      },
                    ),
                  ],
                );
              },
            ),
            mobile: LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = 2;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Grid of small cards
                    Expanded(
                      flex: 2,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: services.length,
                        padding: EdgeInsets.only(right: AppSizes.d4.w),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: AppSizes.d4.h,
                          crossAxisSpacing: AppSizes.d4.w,
                          childAspectRatio: 1.75,
                        ),
                        itemBuilder: (context, index) {
                          final service = services[index];
                          return ServiceCard(
                            title: service['title']!,
                            iconPath: service['icon']!,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: AppSizes.d8.h),
                    // Large card
                    ServiceCardLarge(
                      title: TextStrings.email,

                      onTap: () {
                        // Handle tap
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
