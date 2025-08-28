import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'presentation/home.dart';
import 'core/themes/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const double desktopBreakpoint = 800;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arslan Ali',
      builder: (context, child) {
        final screenWidth = MediaQuery.of(context).size.width;
        final isDesktop = screenWidth >= desktopBreakpoint;
        final theme = isDesktop ? AppTheme.desktop : AppTheme.mobile;

        final designSize = isDesktop
            ? const Size(1440, 1024)
            : const Size(375, 812);

        // Initialize ScreenUtil here inside MaterialApp's builder
        return ScreenUtilInit(
          designSize: designSize,
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, _) {
            return Theme(data: theme, child: child ?? const SizedBox.shrink());
          },
        );
      },
      home: const Home(),
    );
  }
}
