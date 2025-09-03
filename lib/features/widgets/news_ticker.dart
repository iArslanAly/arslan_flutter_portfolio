import '../../core/constants/colors.dart';
import '../../core/constants/sizes.dart';
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
  double speed = 100.0;

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
    "Git & CI/CD",
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
    if (!mounted || !_scrollController.hasClients) return;

    if (_lastElapsed == null) {
      _lastElapsed = elapsed;
      return;
    }

    final delta = elapsed - _lastElapsed!;
    _lastElapsed = elapsed;

    final deltaSeconds = delta.inMicroseconds / 1e6;
    scrollPosition += speed * deltaSeconds;

    if (scrollPosition >= _scrollController.position.maxScrollExtent) {
      scrollPosition = 0;
      if (mounted && _scrollController.hasClients) {
        _scrollController.jumpTo(0);
      }
    } else {
      if (mounted && _scrollController.hasClients) {
        _scrollController.jumpTo(scrollPosition);
      }
    }
  }

  @override
  void dispose() {
    if (_ticker.isActive) {
      _ticker.stop();
    }
    _ticker.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.isDesktop ? 70.h : 40.h,
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
              Icon(
                Icons.star,
                color: Colors.white,
                size: context.isDesktop ? 16.w : 12.w,
              ),
              SizedBox(width: 10.w),
              Text(
                message,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: context.isDesktop ? 16.sp : 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: context.isDesktop ? 30.w : 12.w),
            ],
          );
        },
      ),
    );
  }
}
