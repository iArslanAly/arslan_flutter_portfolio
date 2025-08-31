import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/about/about.dart';
import '../../features/blogs/blogs.dart';
import '../../features/contact/contact.dart';
import '../../features/home/presentation/home.dart';
import '../../features/notFound/not_found.dart';
import '../../features/portfolio/portfolio.dart';
import 'route_names.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RouteNames.home,
  routes: <GoRoute>[
    smoothFadeRoute(path: RouteNames.home, name: 'home', child: const Home()),
    smoothFadeRoute(
      path: RouteNames.about,
      name: 'about',
      child: const About(),
    ),
    smoothFadeRoute(
      path: RouteNames.portfolio,
      name: 'portfolio',
      child: PortfolioPage(),
    ),
    smoothFadeRoute(path: RouteNames.blogs, name: 'blogs', child: BlogsPage()),

    smoothFadeRoute(
      path: RouteNames.contact,
      name: 'contact',
      child: const ContactPage(),
    ),
  ],
  errorBuilder: (context, state) {
    return const NotFoundPage();
  },
);

GoRoute smoothFadeRoute({
  required String path,
  required String name,
  required Widget child,
}) {
  return GoRoute(
    path: path,
    name: name,
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: child,
      // a bit longer so you really feel the fade
      transitionDuration: const Duration(milliseconds: 450),
      transitionsBuilder: (ctx, animation, secondaryAnimation, ch) {
        // wrap in an easeInOut curve
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );
        return FadeTransition(opacity: curved, child: ch);
      },
    ),
  );
}
