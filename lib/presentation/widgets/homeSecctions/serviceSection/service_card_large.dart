import 'package:arslan_flutter_portfolio/core/devices/device_info.dart';
import 'package:arslan_flutter_portfolio/core/widgets/hoverable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/constants/images.dart';
import '../../../../core/constants/text_strings.dart';

class ServiceCardLarge extends StatelessWidget {
  final String title;
  final String label = TextStrings.serviceTabSayHello;
  final VoidCallback? onTap;

  const ServiceCardLarge({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isMobile = DeviceInfo.isMobile(context);

    final double containerWidth = isMobile ? AppSizes.d270.w : AppSizes.d415.w;
    final double containerHeight = isMobile ? AppSizes.d200.h : AppSizes.d400.h;
    final double iconSize = isMobile ? AppSizes.d24.w : AppSizes.d48.w;
    final double fontSize = isMobile ? AppSizes.d16.sp : AppSizes.d32.sp;
    final double labelFontSize = isMobile ? AppSizes.d14.sp : AppSizes.d18.sp;

    return HoverableWidget(
      onTap: onTap,
      builder: (isHovered) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: containerWidth,
          height: containerHeight,
          padding: EdgeInsets.all(AppSizes.d24.w),
          decoration: BoxDecoration(
            color: isHovered ? AppColors.primary : AppColors.onSurface,
            borderRadius: BorderRadius.circular(AppSizes.d20.r),
          ),
          child: Stack(
            children: [
              // Top-right arrow
              Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  AppImages.arrowUpRight,
                  width: iconSize,
                  colorFilter: ColorFilter.mode(
                    isHovered ? AppColors.surface : AppColors.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: labelFontSize,
                        fontWeight: FontWeight.bold,
                        color: AppColors.surface,

                        height: 1.2,
                      ),
                    ),
                    // Bottom-left text
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: AppColors.surface,

                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
