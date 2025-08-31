import 'dart:async';
import 'dart:ui';
import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arslan_flutter_portfolio/core/constants/images.dart';

import '../../../home/domain/project_modal.dart';
import 'card.dart';

class WorkSlider extends StatefulWidget {
  /// Optional callback when a project card is tapped.
  final void Function(Project)? onProjectTap;

  const WorkSlider({super.key, this.onProjectTap});

  @override
  State<WorkSlider> createState() => _WorkSliderRowState();
}

class _WorkSliderRowState extends State<WorkSlider> {
  final ScrollController _scrollController = ScrollController();

  // Provide projects (images should match your assets)
  final List<Project> projects = const [
    Project(imagePath: AppImages.work1, title: 'Project A', tech: 'Flutter'),
    Project(
      imagePath: AppImages.work2,
      title: 'Project B',
      tech: 'Dart, Firebase',
    ),
    Project(
      imagePath: AppImages.work3,
      title: 'Project C',
      tech: 'Flutter Web',
    ),
    Project(imagePath: AppImages.work4, title: 'Project D', tech: 'Animations'),
  ];

  // visual tuning
  final double itemBaseWidth = 300.w;
  final double itemSelectedWidth = 600.w;
  final double itemHeight = 500.h;
  final double horizontalSpacing = 16.w;

  // runtime values (updated in build)
  double _screenCenter = 0.0;
  double _sidePadding = 0.0;
  double _slotWidth = 0.0;
  double _influenceRadius = 0.0;

  // state
  double _currentScroll = 0.0;
  int currentIndex = 0; // which item is considered "centered"

  // throttle to avoid excessive setState calls
  Timer? _throttleTimer;

  @override
  void initState() {
    super.initState();

    // precache images once the widget is first laid out to reduce jank
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (final p in projects) {
        precacheImage(AssetImage(p.imagePath), context);
      }
    });

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _throttleTimer?.cancel();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!mounted) return;

    _currentScroll = _scrollController.hasClients
        ? _scrollController.offset
        : 0.0;

    // compute centered index if geometry already measured
    if (_slotWidth > 0) {
      final double scrollCenter = _currentScroll + _screenCenter;
      final int newIndex = ((scrollCenter - _sidePadding) / _slotWidth)
          .round()
          .clamp(0, projects.length - 1);

      // update index immediately if changed (keeps buttons enabled/disabled accurate)
      if (newIndex != currentIndex) {
        setState(() => currentIndex = newIndex);
        return; // we've already rebuilt — skip throttled paint
      }
    }

    // throttle rebuilds for smoothness (~60fps)
    if (_throttleTimer?.isActive ?? false) return;
    _throttleTimer = Timer(const Duration(milliseconds: 16), () {});
    setState(() {});
  }

  /// Scroll so that [index] item is centered in the viewport.
  void _scrollToIndex(int index) {
    if (!_scrollController.hasClients) return;

    final double targetOffset = (index * _slotWidth).clamp(
      _scrollController.position.minScrollExtent,
      _scrollController.position.maxScrollExtent,
    );

    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );

    setState(() => currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    _screenCenter = MediaQuery.of(context).size.width / 2;
    _slotWidth = itemBaseWidth + horizontalSpacing;
    _sidePadding = _screenCenter - (itemBaseWidth / 2);
    _influenceRadius = _slotWidth; // how far the scaling effect reaches

    return Column(
      children: [
        // slider area
        Expanded(
          child: SizedBox(
            height: itemHeight,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: _sidePadding),
              physics: const BouncingScrollPhysics(),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];

                // compute item center and how close it is to view center
                final double itemOffset = _sidePadding + index * _slotWidth;
                final double itemSlotCenter = itemOffset + itemBaseWidth / 2;
                final double scrollCenter = _currentScroll + _screenCenter;
                final double diff = (scrollCenter - itemSlotCenter).abs();
                final double t = (diff / _influenceRadius).clamp(0.0, 1.0);

                // interpolate width between selected and base
                final double innerWidth =
                    lerpDouble(itemSelectedWidth, itemBaseWidth, t) ??
                    itemBaseWidth;

                // consider the item centered when it is the computed currentIndex
                final bool isCentered = index == currentIndex;

                return SizedBox(
                  width: innerWidth + horizontalSpacing,
                  child: Center(
                    child: GestureDetector(
                      onTap: () => _scrollToIndex(index),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 220),
                            curve: Curves.easeOut,
                            width: innerWidth,
                            height: itemHeight,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4.r),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.asset(
                                    project.imagePath,
                                    fit: BoxFit.cover,
                                    semanticLabel: project.title,
                                  ),

                                  // subtle shadow overlay to mimic boxShadow while avoiding expensive decorations
                                  Positioned.fill(
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black26,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Card overlay shown only when the item is centered.
                          // Uses AnimatedOpacity + Slide for a smooth entrance.
                          // Card overlay shown only when the item is centered.
                          AnimatedProjectCard(
                            title: project.title,
                            tech: project.tech,
                            isVisible: isCentered,
                            onTap: () {
                              project.onTap?.call();
                              widget.onProjectTap?.call(project);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        // controls
        Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: currentIndex > 0
                    ? () => _scrollToIndex(currentIndex - 1)
                    : null,
                icon: Icon(Icons.arrow_back, size: AppSizes.d32.h),
              ),
              SizedBox(width: 24.w),
              IconButton(
                onPressed: currentIndex < projects.length - 1
                    ? () => _scrollToIndex(currentIndex + 1)
                    : null,
                icon: Icon(Icons.arrow_forward, size: AppSizes.d32.h),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
