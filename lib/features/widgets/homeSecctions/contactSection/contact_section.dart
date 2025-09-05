import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:arslan_flutter_portfolio/features/widgets/responsive.dart';

import 'contact_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'contact_info.dart';
import 'contact_form.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.isDesktop;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: isDesktop ? 80.h : 24.h,
        horizontal: isDesktop ? 80.w : 16.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContextTitle(),
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
                Expanded(child: ContactForm()),
                SizedBox(height: 24.h),
                Expanded(child: ContactInfo()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
