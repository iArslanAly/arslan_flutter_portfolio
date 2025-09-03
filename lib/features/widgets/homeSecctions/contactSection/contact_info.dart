import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/text_strings.dart';
import 'contact_info_item.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.isDesktop;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ContactInfoItem(
          icon: Icons.phone,
          label: TextStrings.labelPhone,
          value: TextStrings.phone,
          showDivider: true,
        ),
        SizedBox(height: isDesktop ? AppSizes.d20.h : AppSizes.d10.h),
        ContactInfoItem(
          icon: Icons.email,
          label: TextStrings.labelEmail,
          value: TextStrings.email,
          showDivider: true,
        ),
        SizedBox(height: isDesktop ? AppSizes.d20.h : AppSizes.d10.h),
        ContactInfoItem(
          icon: Icons.location_on,
          label: TextStrings.labelAddress,
          value: TextStrings.address,
          showDivider: false,
        ),
      ],
    );
  }
}
