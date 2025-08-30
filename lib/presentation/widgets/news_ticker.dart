import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsTickerBanner extends StatefulWidget {
  const NewsTickerBanner({super.key});

  @override
  State<NewsTickerBanner> createState() => _NewsTickerBannerState();
}

class _NewsTickerBannerState extends State<NewsTickerBanner>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late final Ticker _ticker;

  double scrollPosition = 0.0;
  double speed = 300.0;

  final List<String> messages = [
    "Flutter Developer",
    "Available for Freelance",
    "Open for Collaboration",
    "UI/UX Enthusiast",
    "Dart Specialist",
    "Cross-Platform Apps",
    "Clean Code Advocate",
    "Firebase Integration",
    "Responsive UI Designer",
    "Performance Optimizer",
    "Open Source Contributor",
    "Agile Team Player",
    "Pixel-Perfect Design",
    "Git & CI/CD Expert",
    "REST & GraphQL APIs",
    "Flutter Web Ready",
    "Dark Mode Enthusiast",
    "State Management Pro",
    "Custom Animations",
    "Scalable Architecture",
  ];

  @override
  void initState() {
    super.initState();

    _ticker = createTicker(_onTick)..start();
  }

  Duration? _lastElapsed;

  void _onTick(Duration elapsed) {
    if (!_scrollController.hasClients) return;

    if (_lastElapsed == null) {
      _lastElapsed = elapsed;
      return;
    }

    final delta = elapsed - _lastElapsed!;
    final deltaSeconds = delta.inMicroseconds / 1e6;
    _lastElapsed = elapsed;

    scrollPosition += speed * deltaSeconds;

    if (_scrollController.hasClients) {
      if (scrollPosition >= _scrollController.position.maxScrollExtent) {
        scrollPosition = 0;
        _scrollController.jumpTo(0);
      } else {
        _scrollController.jumpTo(scrollPosition);
      }
    }
  }

  @override
  void dispose() {
    _ticker.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.h,
      color: AppColors.primary,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 100, // High enough for infinite effect
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
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 30.w),
            ],
          );
        },
      ),
    );
  }
}
