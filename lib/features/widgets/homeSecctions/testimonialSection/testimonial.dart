import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/raw_data.dart';
import 'testimonial_title.dart';

class TestimonialSection extends StatelessWidget {
  const TestimonialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TestimonialTitle(),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: testimonials
                .map(
                  (testimonial) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: testimonial,
                  ),
                )
                .toList(),
          ),
        ),

        SizedBox(height: 90.h),
      ],
    );
  }
}
