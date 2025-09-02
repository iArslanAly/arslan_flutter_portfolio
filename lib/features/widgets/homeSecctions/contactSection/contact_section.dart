import 'contact_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'contact_info.dart';
import 'contact_form.dart';

class ContectSection extends StatelessWidget {
  const ContectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(80.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContextTitle(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: ContactForm()),
              SizedBox(width: 60.w),
              Expanded(child: ContactInfo()),
            ],
          ),
        ],
      ),
    );
  }
}
