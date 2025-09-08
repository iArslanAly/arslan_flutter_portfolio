import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/route_names.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../core/widgets/desktop_appbar.dart';
import '../../../../core/widgets/mobile_appbar.dart';
import '../../../widgets/homeSecctions/footer/footer.dart';
import '../bloc/project_bloc.dart';
import '../bloc/project_event.dart';
import '../bloc/project_states.dart';
import '../widgets/portfolio_card.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final id = GoRouterState.of(context).pathParameters['id']!;
    final isDesktop = context.isDesktop;

    return BlocProvider.value(
      value: context.read<ProjectBloc>()..add(LoadProjectById(id)),
      child: Scaffold(
        appBar: isDesktop
            ? DesktopAppBar(onNavTogglePressed: () {})
            : MobileAppBar(),
        endDrawer: isDesktop ? null : const MobileDrawer(),
        body: BlocBuilder<ProjectBloc, ProjectState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.errorMessage != null) {
              return Center(child: Text(state.errorMessage!));
            }

            final project = state.selectedProject;
            if (project == null) {
              return const Center(child: Text("No project found"));
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  /// ✅ Header section with green + white split and poster
                  SizedBox(
                    width: double.infinity,
                    height: 580.h + 300.h, // poster + half offset
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        /// Background split
                        Column(
                          children: [
                            Container(
                              height: 500.h, // half poster height
                              color: Colors.green,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 80.h,
                                      horizontal: 80.w,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        /// Left side
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                _DotText(
                                                  text: project.category,
                                                ),
                                                SizedBox(width: 16.w),
                                                _DotText(
                                                  text: project.postDate,
                                                ),
                                                SizedBox(width: 16.w),
                                                _DotText(
                                                  text: project.duration,
                                                ),
                                              ],
                                            ),
                                            Text(
                                              project.title,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium
                                                  ?.copyWith(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 48.sp,
                                                  ),
                                            ),
                                          ],
                                        ),

                                        /// Right side
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                _InfoColumn(
                                                  label: "Client",
                                                  value: project.client,
                                                ),
                                                SizedBox(width: 16.h),
                                                _InfoColumn(
                                                  label: "Role",
                                                  value: project.role,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 12.h),
                                            _InfoColumn(
                                              label: "Tools",
                                              value: project.tools.join(', '),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        /// Poster overlaps
                        Positioned(
                          top: 200
                              .h, // overlap half into green + half into white
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              width: 1280.w,
                              height: 580.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                image: DecorationImage(
                                  image: NetworkImage(project.poster),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// ✅ Content area (white with padding)
                  Container(
                    width: double.infinity,

                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 80.w,
                      ), // ⬅️ Global horizontal padding
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Project Overview",
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32.sp,
                                ),
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            project.overview,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(fontSize: 16.sp, height: 1.5),
                          ),
                          SizedBox(height: 48.h),

                          _IconListSection(
                            title: "Features",
                            items: project.features,
                            icon: Icons.check_circle_rounded,
                            iconColor: Colors.green,
                          ),
                          _IconListSection(
                            title: "Challenges",
                            items: project.challenges,
                            icon: Icons.warning_amber_rounded,
                            iconColor: Colors.orange,
                          ),
                          _IconListSection(
                            title: "Solutions",
                            items: project.solutions,
                            icon: Icons.lightbulb_rounded,
                            iconColor: Colors.blue,
                          ),

                          SizedBox(height: 16.h),
                          Text(
                            "Technologies",
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.sp,
                                ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            project.tags.join(', '),
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(fontSize: 14.sp),
                          ),

                          SizedBox(height: 32.h),
                          Text(
                            "Conclusion",
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.sp,
                                ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            project.conclusion,
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(fontSize: 14.sp),
                          ),

                          SizedBox(height: 32.h),
                          Text(
                            "Related",
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.sp,
                                ),
                          ),
                          SizedBox(
                            height: context.isDesktop
                                ? AppSizes.d40.h
                                : AppSizes.d20.h,
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: isDesktop ? 3 : 1,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                  childAspectRatio: 410 / 450,
                                ),
                            itemCount: project.relatedProjects.length,
                            itemBuilder: (context, index) {
                              final related = project.relatedProjects[index];
                              return HoverImageCard(
                                imageUrl: related.thumbnail,
                                title: related.title,
                                overview: [related.category],
                                onTap: () {
                                  context.push(
                                    '${RouteNames.portfolio}/${related.id}',
                                  );
                                },
                              );
                            },
                          ),

                          SizedBox(height: 24.h),
                        ],
                      ),
                    ),
                  ),

                  FooterSection(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _DotText extends StatelessWidget {
  final String text;

  const _DotText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4.w,
          height: 4.h,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          text,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.white, fontSize: 14.sp),
        ),
      ],
    );
  }
}

/// ✅ Private widget for label + value column
class _InfoColumn extends StatelessWidget {
  final String label;
  final String value;

  const _InfoColumn({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.white70,
            fontSize: 14.sp,
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

/// ✅ Reusable Section with Icon List
class _IconListSection extends StatelessWidget {
  final String title;
  final List<String> items;
  final IconData icon;
  final Color iconColor;

  const _IconListSection({
    required this.title,
    required this.items,
    required this.icon,
    this.iconColor = Colors.green, // default to green
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
            ),
          ),
          SizedBox(height: 12.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items.map((item) {
              return Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(icon, color: iconColor, size: 18.sp),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        item,
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
