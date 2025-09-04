import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/images.dart';
import '../../../../core/widgets/round_icon_button.dart';
import '../../../home/domain/project_modal.dart';
import 'card.dart';

class WorkSlider extends StatefulWidget {
  final void Function(Project)? onProjectTap;

  const WorkSlider({super.key, this.onProjectTap});

  @override
  State<WorkSlider> createState() => _WorkSliderRowState();
}

class _WorkSliderRowState extends State<WorkSlider> {
  final ScrollController _scrollController = ScrollController();

  final List<Project> projects = const [
    Project(
      imagePath: AppImages.work1,
      title: 'CINEX',
      tech: 'Flutter, Firebase, RestApi, NodeJS',
    ),
    Project(
      imagePath: AppImages.work2,
      title: 'TrueSight',
      tech: 'Dart, Firebase, RestApi',
    ),
  ];

  // runtime values
  double _screenCenter = 0;
  double _sidePadding = 0.0;
  double _slotWidth = 0.0;
  double _influenceRadius = 0.0;

  // state
  double _currentScroll = 0.0;
  int currentIndex = 0;
  int? _hoveredIndex;

  Timer? _throttleTimer;

  @override
  void initState() {
    super.initState();
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

    if (_slotWidth > 0) {
      final double scrollCenter = _currentScroll + _screenCenter;
      final int newIndex = ((scrollCenter - _sidePadding) / _slotWidth)
          .round()
          .clamp(0, projects.length - 1);

      if (newIndex != currentIndex) {
        setState(() => currentIndex = newIndex);
        return;
      }
    }

    if (_throttleTimer?.isActive ?? false) return;
    _throttleTimer = Timer(const Duration(milliseconds: 16), () {});
    setState(() {});
  }

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
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isDesktop = screenWidth > 800;

    // 🔹 Responsive dimensions (calculated ONCE per build)
    final double itemBaseWidth = (isDesktop ? 300 : 120).w;
    final double itemSelectedWidth = (isDesktop ? 600 : 200).w;
    final double itemHeight = (isDesktop ? 500 : 200).h;
    final double horizontalSpacing = (isDesktop ? 16 : 8).w;

    // 🔹 Geometry setup
    _screenCenter = (screenWidth / 2) - (itemBaseWidth / 2);
    _slotWidth = itemBaseWidth + horizontalSpacing;
    _sidePadding = _screenCenter - (itemBaseWidth / 2);
    _influenceRadius = _slotWidth;

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

                // position math
                final double itemOffset = _sidePadding + index * _slotWidth;
                final double itemSlotCenter = itemOffset + itemBaseWidth / 2;
                final double scrollCenter = _currentScroll + _screenCenter;
                final double diff = (scrollCenter - itemSlotCenter).abs();
                final double t = (diff / _influenceRadius).clamp(0.0, 1.0);

                // 🔹 interpolated width
                final double innerWidth =
                    lerpDouble(itemSelectedWidth, itemBaseWidth, t) ??
                    itemBaseWidth;

                final bool isCentered = index == currentIndex;
                final bool isHovered = index == _hoveredIndex;
                final double hoverScale = isHovered ? 1.01 : 1.0;

                return SizedBox(
                  width: innerWidth + horizontalSpacing,
                  child: Center(
                    child: MouseRegion(
                      onEnter: (_) => setState(() => _hoveredIndex = index),
                      onExit: (_) => setState(() => _hoveredIndex = null),
                      child: AnimatedScale(
                        scale: hoverScale,
                        duration: const Duration(milliseconds: 150),
                        curve: Curves.easeOut,
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
                                      ColorFiltered(
                                        colorFilter: isCentered
                                            ? ColorFilter.mode(
                                                AppColors.surface.withValues(
                                                  alpha: 0.5,
                                                ),
                                                BlendMode.modulate,
                                              )
                                            : const ColorFilter.mode(
                                                Colors.transparent,
                                                BlendMode.multiply,
                                              ),
                                        child: Image.asset(
                                          project.imagePath,
                                          fit: BoxFit.cover,
                                          semanticLabel: project.title,
                                        ),
                                      ),
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
              RoundIconButton(
                onPressed: currentIndex > 0
                    ? () => _scrollToIndex(currentIndex - 1)
                    : null,
                icon: Icons.arrow_back,
              ),
              SizedBox(width: isDesktop ? 24.w : 12.w),
              RoundIconButton(
                onPressed: currentIndex < projects.length - 1
                    ? () => _scrollToIndex(currentIndex + 1)
                    : null,
                icon: Icons.arrow_forward,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
