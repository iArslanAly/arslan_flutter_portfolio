import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
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
    final isDesktop = context.isDesktop;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isDesktop ? AppSizes.d70.w : AppSizes.d16.w),
      decoration: BoxDecoration(color: AppColors.surface),
      child: Column(
        children: [
          BlogTitle(),
          SizedBox(height: isDesktop ? AppSizes.d40.h : AppSizes.d20.h),

          // latest three blogs
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Row with 3 blogs
              isDesktop
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: blogs
                          .map((blog) {
                            return Padding(
                              padding: EdgeInsets.only(
                                right: isDesktop
                                    ? AppSizes.d20.w
                                    : AppSizes.d10.w,
                              ),
                              child: BlogCard(blog: blog),
                            );
                          })
                          .take(3)
                          .toList(),
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: blogs
                            .map((blog) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  right: isDesktop
                                      ? AppSizes.d20.w
                                      : AppSizes.d10.w,
                                ),
                                child: BlogCard(blog: blog),
                              );
                            })
                            .take(3)
                            .toList(),
                      ),
                    ),

              SizedBox(height: isDesktop ? AppSizes.d40.h : AppSizes.d20.h),

              /// View More Button
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: isDesktop ? AppSizes.d210.w : AppSizes.d150.w,
                  height: isDesktop ? AppSizes.d55.h : AppSizes.d50.h,
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
