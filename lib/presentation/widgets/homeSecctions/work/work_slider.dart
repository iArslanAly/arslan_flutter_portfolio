import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arslan_flutter_portfolio/core/constants/images.dart';

class WorkSlider extends StatefulWidget {
  const WorkSlider({super.key});

  @override
  State<WorkSlider> createState() => _WorkSliderState();
}

class _WorkSliderState extends State<WorkSlider> {
  final List<String> imagePaths = [
    AppImages.work1,
    AppImages.work2,
    AppImages.work3,
    AppImages.work4,
  ];

  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    // (300 + 8 + 700 + 8 + 300) = 1316 width to show 3 images with gaps
    final double totalWidth = 700 + 300 + 300 + 16; // 8px gap between each
    final double screenWidth = 1440; // Set your design screen width
    final double viewportFraction = totalWidth / screenWidth;

    _pageController = PageController(
      viewportFraction: viewportFraction,
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// Determines width of image based on page position
  double _calculateItemWidth(int index, double page) {
    double diff = (page - index).abs();

    if (diff > 1) return 300.w;

    return lerpDouble(700.w, 300.w, diff)!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      child: PageView.builder(
        controller: _pageController,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double currentPage = _pageController.hasClients
                  ? _pageController.page ??
                        _pageController.initialPage.toDouble()
                  : _pageController.initialPage.toDouble();

              double width = _calculateItemWidth(index, currentPage);

              return Center(
                child: Container(
                  width: width,
                  height: 500.h,
                  margin: EdgeInsets.symmetric(
                    horizontal: 4.w,
                  ), // 8px total gap
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage(imagePaths[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
