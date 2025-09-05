import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:arslan_flutter_portfolio/features/widgets/homeSecctions/footer/footer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/text_strings.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/widgets/app_drawer.dart';
import '../../../../core/widgets/desktop_appbar.dart';
import '../../../../core/widgets/mobile_appbar.dart';
import '../../../../core/widgets/page_header.dart';
import '../../../widgets/homeSecctions/contactSection/contact_section.dart';
import '../../domain/entity/entities.dart';
import '../bloc/project_bloc.dart';
import '../bloc/project_states.dart';
import '../widgets/portfolio_card.dart';

class PortfolioPage extends StatelessWidget {
  PortfolioPage({super.key});
  final List<ProjectEntity> projects = [];
  @override
  Widget build(BuildContext context) {
    final isDesktop = context.isDesktop;
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state.errorMessage != null) {
          return SizedBox(
            height: 200,
            child: Center(child: Text(state.errorMessage!)),
          );
        }

        return Scaffold(
          appBar: isDesktop
              ? DesktopAppBar(onNavTogglePressed: () {})
              : MobileAppBar(),
          endDrawer: isDesktop ? null : const MobileDrawer(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: isDesktop ? AppSizes.d40.h : AppSizes.d20.h,
                    left: isDesktop ? AppSizes.d80.w : AppSizes.d16.w,
                    right: isDesktop ? AppSizes.d80.w : AppSizes.d16.w,
                    bottom: isDesktop ? AppSizes.d24.h : AppSizes.d20.h,
                  ),
                  child: Column(
                    children: [
                      PageHeader(
                        label: TextStrings.workLabel,
                        title: TextStrings.workTitle,
                        subtitle: TextStrings.workSubtitle,
                      ),
                      SizedBox(
                        height: context.isDesktop
                            ? AppSizes.d40.h
                            : AppSizes.d20.h,
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isDesktop
                              ? 3
                              : 1, // 3 per row on desktop, 1 on mobile
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 410 / 450, // keep card ratio
                        ),
                        itemCount: state.projects.length,
                        itemBuilder: (context, index) {
                          final project = state.projects[index];
                          return HoverImageCard(
                            imageUrl: project.thumbnail,
                            title: project.title,
                            overview: [project.overview],
                            onTap: () {
                              context.push(
                                '${RouteNames.portfolio}/${project.id}',
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                ContactSection(),
                FooterSection(),
              ],
            ),
          ),
        );
      },
    );
  }
}
