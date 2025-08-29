import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsTickerBanner extends StatefulWidget {
  const NewsTickerBanner({super.key});

  @override
  State<NewsTickerBanner> createState() => _NewsTickerBannerState();
}

class _NewsTickerBannerState extends State<NewsTickerBanner> {
  final ScrollController _scrollController = ScrollController();
  double scrollPosition = 0.0;

  late Timer _timer;

  final List<String> messages = [
    "Flutter Developer",
    "Available for Freelance",
    "Open for Collaboration",
    "UI/UX Enthusiast",
    "Dart Specialist",
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(milliseconds: 30), (_) {
      if (_scrollController.hasClients) {
        scrollPosition += 1;
        if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent) {
          scrollPosition = 0;
          _scrollController.jumpTo(0);
        } else {
          _scrollController.jumpTo(scrollPosition);
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 1440.w,
        height: 70.h,
        color: Colors.black,
        alignment: Alignment.centerLeft,
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final message = messages[index % messages.length];
            return Row(
              children: [
                Icon(Icons.star, color: Colors.white, size: 16.w),
                SizedBox(width: 10.w),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 30.w),
              ],
            );
          },
          itemCount: 100, // Repeat enough times for continuous effect
        ),
      ),
    );
  }
}
