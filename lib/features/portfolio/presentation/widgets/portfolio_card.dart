import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/hoverable_widget.dart';

class HoverImageCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final List<String> overview;
  final VoidCallback? onTap;

  const HoverImageCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.overview,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.isDesktop;
    return HoverableWidget(
      onTap: onTap,
      builder: (isHovered) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 410,
            height: 450,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                // Overlay shown on hover
                Padding(
                  padding: EdgeInsets.all(16.h),
                  child: AnimatedOpacity(
                    opacity: isHovered ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      color: Colors.green.withOpacity(0.7),
                      padding: EdgeInsets.all(24.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Title
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  color: Colors.white,
                                  fontSize: isDesktop ? 24.sp : 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 8),

                          // Divider
                          Divider(
                            color: Colors.white,
                            thickness: 2,
                            indent: 50,
                            endIndent: 50,
                          ),
                          const SizedBox(height: 12),

                          // Overview (max 5 lines)
                          ...overview
                              .take(5)
                              .map(
                                (line) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2,
                                  ),
                                  child: Text(
                                    line,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontSize: isDesktop ? 13.sp : 10.sp,
                                          height: 1.4,
                                        ),
                                  ),
                                ),
                              ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
