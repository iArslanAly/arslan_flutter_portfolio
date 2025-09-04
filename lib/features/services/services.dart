import 'package:arslan_flutter_portfolio/core/widgets/desktop_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/text_strings.dart';
import '../../../core/constants/images.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/constants/colors.dart';
import '../../core/widgets/app_drawer.dart';
import '../../core/widgets/mobile_appbar.dart';
import '../widgets/homeSecctions/footer/footer.dart';
import '../widgets/homeSecctions/testimonialSection/testimonial.dart';
import '../widgets/services/service_page_card.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {
        'title': TextStrings.serviceTabMobile,
        'subtitle':
            'Cross-platform mobile apps with Flutter. Fast, reliable, and user-friendly.',
        'icon': AppImages.mobile,
      },
      {
        'title': TextStrings.serviceTabWeb,
        'subtitle':
            'Responsive and modern web solutions. Optimized for performance and SEO.',
        'icon': AppImages.webDev,
      },
      {
        'title': TextStrings.serviceTabUiUx,
        'subtitle':
            'Pixel-perfect UI designs with a focus on UX. Delivering intuitive user journeys.',
        'icon': AppImages.uiux,
      },
      {
        'title': TextStrings.serviceTabFlutterFlow,
        'subtitle':
            'Visual app development with FlutterFlow. Faster prototyping, quicker delivery.',
        'icon': AppImages.flutterFlow,
      },
      {
        'title': TextStrings.serviceTabAppOptimization,
        'subtitle':
            'Improve speed, stability, and scalability. Ensure smooth performance across devices.',
        'icon': AppImages.optimization,
      },
      {
        'title': TextStrings.serviceTabAppStore,
        'subtitle':
            'End-to-end deployment on app stores. Guidance from publishing to updates.',
        'icon': AppImages.optimization,
      },
    ];
    final isDesktop = context.isDesktop;
    return Scaffold(
      appBar: isDesktop
          ? DesktopAppBar(onNavTogglePressed: () {})
          : MobileAppBar(),
      endDrawer: isDesktop ? null : const MobileDrawer(),
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: isDesktop ? AppSizes.d40.h : AppSizes.d20.h,
                  left: isDesktop ? AppSizes.d80.w : AppSizes.d16.w,
                  right: isDesktop ? AppSizes.d80.w : AppSizes.d16.w,
                  bottom: isDesktop ? AppSizes.d24.h : AppSizes.d20.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Title + Subtitle (centered)
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: context.isDesktop ? 800.w : 350.w,
                      ),
                      child: Column(
                        children: [
                          Text(
                            TextStrings.servicesLabel.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(
                                  fontSize: context.isDesktop
                                      ? AppSizes.d20.sp
                                      : AppSizes.d12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                          ),
                          SizedBox(height: AppSizes.d12.h),
                          Text(
                            TextStrings.servicesTitle,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineLarge
                                ?.copyWith(
                                  fontSize: context.isDesktop
                                      ? AppSizes.d48.sp
                                      : AppSizes.d22.sp,
                                  color: AppColors.textPrimary,
                                ),
                          ),
                          SizedBox(height: AppSizes.d12.h),
                          Text(
                            TextStrings.servicesSubtitle,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  fontSize: AppSizes.d16.sp,
                                  color: AppColors.textSecondary,
                                  height: 1.5,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: context.isDesktop
                          ? AppSizes.d40.h
                          : AppSizes.d20.h,
                    ),

                    // Grid of cards
                    Wrap(
                      spacing: AppSizes.d20.w,
                      runSpacing: AppSizes.d20.h,
                      alignment: WrapAlignment.center,
                      children: services.map((service) {
                        return ServicePageCard(
                          title: service['title']!,
                          subtitle: service['subtitle']!,
                          iconPath: service['icon']!,
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: isDesktop ? AppSizes.d24.h : AppSizes.d14.h),
              TestimonialSection(),
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
