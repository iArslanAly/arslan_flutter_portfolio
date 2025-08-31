import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/raw_data.dart';
import '../../../../core/widgets/cta.dart';
import 'blog_card.dart';
import 'blog_title.dart';

class BlogSection extends StatelessWidget {
  const BlogSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(70.w),
      decoration: BoxDecoration(color: AppColors.surface),
      child: Column(
        children: [
          BlogTitle(),
          SizedBox(height: 20.h),

          // latest three blogs
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Row with 3 blogs
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: blogs
                    .map((blog) {
                      return Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: BlogCard(blog: blog),
                      );
                    })
                    .take(3)
                    .toList(),
              ),

              SizedBox(height: 40.h),

              /// View More Button
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 210.w,
                  height: 55.h,
                  child: CTA(
                    label: "View More Blogs",
                    onPressed: () {
                      debugPrint("Navigate to All Blogs page");
                      // Navigator.push(...); // 👉 go to full blogs screen
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
