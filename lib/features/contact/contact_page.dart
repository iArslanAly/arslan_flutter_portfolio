import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:arslan_flutter_portfolio/features/widgets/homeSecctions/footer/footer.dart';
import 'package:arslan_flutter_portfolio/features/widgets/responsive.dart';

import '../../core/constants/colors.dart';
import '../../core/widgets/app_drawer.dart';
import '../../core/widgets/desktop_appbar.dart';
import '../../core/widgets/mobile_appbar.dart';
import '../widgets/homeSecctions/contactSection/contact_form.dart';
import '../widgets/homeSecctions/contactSection/contact_info.dart';
import '../widgets/homeSecctions/contactSection/contact_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.isDesktop;
    return Scaffold(
      appBar: isDesktop
          ? DesktopAppBar(onNavTogglePressed: () {})
          : MobileAppBar(),
      endDrawer: isDesktop ? null : const MobileDrawer(),
      body: Container(
        color: AppColors.background,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // main content with padding
              Padding(
                padding: EdgeInsets.only(
                  left: isDesktop ? 80.w : 16.w,
                  right: isDesktop ? 80.w : 16.w,
                  top: isDesktop ? 80.h : 24.h,
                  bottom: isDesktop ? 40.h : 24.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContextTitle(),
                    SizedBox(height: isDesktop ? 40.h : 24.h),
                    Responsive(
                      desktop: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(child: ContactForm()),
                          SizedBox(width: 60.w),
                          Expanded(child: ContactInfo()),
                        ],
                      ),
                      mobile: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ContactForm(),
                          SizedBox(height: 24.h),
                          ContactInfo(),
                        ],
                      ),
                    ),
                    SizedBox(height: isDesktop ? 40.h : 24.h),
                  ],
                ),
              ),

              // footer OUTSIDE padding → full width
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
