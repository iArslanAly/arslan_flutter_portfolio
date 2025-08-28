import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'presentation/home.dart';
import 'core/themes/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const double desktopBreakpoint = 800;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final screenWidth = MediaQuery.of(context).size.width;

        final isDesktop = screenWidth >= desktopBreakpoint;
        final theme = isDesktop ? AppTheme.desktop : AppTheme.mobile;

        // ✅ Choose design size based on layout
        final designSize = isDesktop
            ? const Size(1440, 1024)
            : const Size(375, 812);

        return ScreenUtilInit(
          designSize: designSize,
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Arslan Ali',
              theme: theme,
              home: child,
            );
          },
          child: const Home(), // ✅ Put your widget tree here
        );
      },
    );
  }
}
