import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedProjectCard extends StatelessWidget {
  final String title;
  final String tech;
  final VoidCallback? onTap;
  final bool isVisible;
  final double bottom;
  final double left;

  const AnimatedProjectCard({
    super.key,
    required this.title,
    required this.tech,
    this.onTap,
    required this.isVisible,
    this.bottom = 24,
    this.left = 24,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.isDesktop;
    return Positioned(
      bottom: bottom.h,
      left: left.w,
      child: AnimatedOpacity(
        opacity: isVisible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        child: AnimatedSlide(
          offset: isVisible ? Offset.zero : const Offset(0, 0.1),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          child: InkWell(
            onTap: isVisible ? onTap : null,
            child: Material(
              elevation: isVisible ? 6 : 0,
              borderRadius: BorderRadius.circular(8.r),
              color: Theme.of(context).cardColor,
              child: SizedBox(
                width: isDesktop ? 240.w : 120.w,
                height: isDesktop ? 112.h : 55.h,
                child: Row(
                  children: [
                    /// 70% Text Area
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isDesktop ? 16.w : 8.w,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    fontSize: isDesktop ? 24.sp : 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              tech,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    fontSize: isDesktop ? 10.sp : 6.sp,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// 30% Button Area
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(isDesktop ? 8.r : 4.r),
                            bottomRight: Radius.circular(isDesktop ? 8.r : 4.r),
                          ),
                        ),
                        child: Center(
                          child: Container(
                            height: isDesktop ? 44.h : 24.h,
                            width: isDesktop ? 44.h : 24.h,
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(28.r),
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              size: isDesktop ? 24.h : 14.h,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
