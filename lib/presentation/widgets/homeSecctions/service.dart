import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:arslan_flutter_portfolio/core/constants/images.dart';
import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:arslan_flutter_portfolio/presentation/widgets/serive_card_large.dart';
import 'package:arslan_flutter_portfolio/presentation/widgets/service_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/text_strings.dart';

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
        vertical: AppSizes.d90.h,
        horizontal: AppSizes.d80.w,
      ),
      decoration: BoxDecoration(color: AppColors.background),
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
                      fontSize: AppSizes.d16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    TextStrings.servicesTitle,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: AppSizes.d40.sp,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: AppSizes.d650.w,

                child: Text(
                  TextStrings.servicesSubtitle,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: AppSizes.d16.sp,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.d16.h),

          // Grid/Wrap Section
          LayoutBuilder(
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
        ],
      ),
    );
  }
}
