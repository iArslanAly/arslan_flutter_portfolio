import 'package:flutter/widgets.dart';

extension ResponsiveExt on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  bool get isMobile => screenWidth < 600;
  bool get isTablet => screenWidth >= 600 && screenWidth < 800;
  bool get isDesktop => screenWidth >= 800;
}

class AppSizes {
  // Padding and margin sizes
  static double xs = 4.0;
  static double sm = 8.0;
  static double md = 16.0;
  static double lg = 24.0;
  static double xl = 32.0;

  // Icon sizes
  static double iconXs = 12.0;
  static double iconSm = 16.0;
  static double iconMd = 24.0;
  static double iconLg = 32.0;
  // Font sizes
  static double fontSizeSm = 14.0;
  static double fontSizeMd = 16.0;
  static double fontSizeLg = 18.0;

  // Button sizes
  static double buttonHeight = 18.0;
  static double buttonRadius = 12.0;
  static double buttonWidth = 120.0;
  static double buttonElevation = 4.0;

  // AppBar height
  static double appBarHeight = 56.0;
  // Image sizes
  static double imageThumbSize = 80.0;
  static double imageSize = 100.0;
  static double imageHeight = 150.0;

  // Default spacing between sections
  static double defaultSpace = 24.0;
  static double spaceBtwItems = 16.0;
  static double spaceBtwSections = 32.0;

  // Border radius
  static double borderRadiusSm = 4.0;
  static double borderRadiusMd = 8.0;
  static double borderRadiusLg = 12.0;

  // Divider height
  static double dividerHeight = 1.0;

  // Product item dimensionsI
  static double productImageSize = 120.0;
  static double productImageRadius = 16.0;
  static double productItemHeight = 160.0;

  // Input field
  static double inputFieldRadius = 12.0;
  static double spaceBtwInputFields = 16.0;

  // Card sizes
  static double cardRadiusLg = 16.0;
  static double cardRadiusMd = 12.0;
  static double cardRadiusSm = 10.0;
  static double cardRadiusXs = 6.0;
  static double cardElevation = 2.0;

  // Image carousel height
  static double imageCarouselHeight = 200.0;

  // Loading indicator size
  static double loadingIndicatorSize = 36.0;

  // Grid view spacing
  static double gridViewSpacing = 16.0;

  // baseline height,
  static double baselineHeight = 38.0;

  /// baseline padding
  static int i0 = 0;
  static int i1 = 1;
  static int i2 = 2;
  static int i3 = 3;
  static int i4 = 4;
  static int i5 = 5;
  static int i6 = 6;
  static int i7 = 7;
  static int i8 = 8;
  static int i9 = 9;
  static int i10 = 10;
  static int i11 = 11;
  static int i12 = 12;
  static int i13 = 13;
  static int i14 = 14;
  static int i15 = 15;
  static int i16 = 16;
  static int i30 = 30;
  static int i50 = 50;
  static int i100 = 100;
  static int i120 = 120;
  static int i130 = 130;
  static int i140 = 140;
  static int i145 = 145;
  static int i150 = 150;
  static int i175 = 175;
  static int i200 = 200;
  static int i300 = 300;
  static int i400 = 400;
  static int i500 = 500;
  static int i550 = 550;
  static int i600 = 600;
  static int i700 = 700;
  static int i750 = 750;
  static int i800 = 800;
  static int i1000 = 1000;

  /// Percentage values
  static double zeroPercent = 0.0;
  static double onePercent = .01;
  static double twoPercent = .02;
  static double threePercent = .03;
  static double fourPercent = .04;
  static double fivePercent = .05;
  static double sixPercent = .06;
  static double sevenPercent = .07;
  static double eightPercent = .08;
  static double ninePercent = .09;
  static double tenPercent = .10;
  static double fifteenPercent = .15;

  /// Double values for precise measurements
  static double pointZero = 0.0;
  static double pointZeroOne = 0.01;
  static double pointZeroTwo = 0.02;
  static double pointZeroThree = 0.03;
  static double pointZeroFour = 0.04;
  static double pointZeroFive = 0.05;
  static double pointZeroSix = 0.06;
  static double pointZeroSeven = 0.07;
  static double pointZeroEight = 0.08;
  static double pointZeroNine = 0.09;
  static double pointOne = 0.1;
  static double pointTwo = 0.2;
  static double pointThree = 0.3;
  static double pointFour = 0.4;
  static double pointFive = 0.5;
  static double pointSix = 0.6;
  static double pointSeven = 0.7;
  static double pointEight = 0.8;
  static double pointNine = 0.9;
  static double onePointZero = 1.0;
  static double onePointOne = 1.1;
  static double onePointTwo = 1.2;
  static double onePointThree = 1.3;
  static double onePointFour = 1.4;
  static double onePointFive = 1.5;
  static double onePointSix = 1.6;
  static double onePointSeven = 1.7;
  static double onePointEight = 1.8;
  static double onePointNine = 1.9;

  /// Double values
  static double d0 = 0.0;
  static double d1 = 1.0;
  static double d2 = 2.0;
  static double d3 = 3.0;
  static double d4 = 4.0;
  static double d5 = 5.0;
  static double d6 = 6.0;
  static double d7 = 7.0;
  static double d8 = 8.0;
  static double d9 = 9.0;
  static double d10 = 10.0;
  static double d11 = 11.0;
  static double d12 = 12.0;
  static double d13 = 13.0;
  static double d14 = 14.0;
  static double d15 = 15.0;
  static double d16 = 16.0;
  static double d17 = 17.0;
  static double d18 = 18.0;
  static double d19 = 19.0;
  static double d20 = 20.0;
  static double d21 = 21.0;
  static double d22 = 22.0;
  static double d23 = 23.0;
  static double d24 = 24.0;
  static double d25 = 25.0;
  static double d26 = 26.0;
  static double d27 = 27.0;
  static double d28 = 28.0;
  static double d29 = 29.0;
  static double d30 = 30.0;
  static double d31 = 31.0;
  static double d32 = 32.0;
  static double d33 = 33.0;
  static double d34 = 34.0;
  static double d35 = 35.0;
  static double d36 = 36.0;
  static double d37 = 37.0;
  static double d38 = 38.0;
  static double d39 = 39.0;
  static double d40 = 40.0;
  static double d41 = 41.0;
  static double d42 = 42.0;
  static double d43 = 43.0;
  static double d44 = 44.0;
  static double d45 = 45.0;
  static double d46 = 46.0;
  static double d47 = 47.0;
  static double d48 = 48.0;
  static double d49 = 49.0;
  static double d50 = 50.0;
  static double d51 = 51.0;
  static double d52 = 52.0;
  static double d53 = 53.0;
  static double d54 = 54.0;
  static double d55 = 55.0;
  static double d56 = 56.0;
  static double d57 = 57.0;
  static double d58 = 58.0;
  static double d59 = 59.0;
  static double d60 = 60.0;
  static double d61 = 61.0;
  static double d62 = 62.0;
  static double d63 = 63.0;
  static double d64 = 64.0;
  static double d65 = 65.0;
  static double d66 = 66.0;
  static double d67 = 67.0;
  static double d68 = 68.0;
  static double d69 = 69.0;
  static double d70 = 70.0;
  static double d71 = 71.0;
  static double d72 = 72.0;
  static double d73 = 73.0;
  static double d74 = 74.0;
  static double d75 = 75.0;
  static double d76 = 76.0;
  static double d77 = 77.0;
  static double d78 = 78.0;
  static double d79 = 79.0;
  static double d80 = 80.0;
  static double d81 = 81.0;
  static double d82 = 82.0;
  static double d83 = 83.0;
  static double d84 = 84.0;
  static double d85 = 85.0;
  static double d86 = 86.0;
  static double d87 = 87.0;
  static double d88 = 88.0;
  static double d89 = 89.0;
  static double d90 = 90.0;
  static double d91 = 91.0;
  static double d92 = 92.0;
  static double d93 = 93.0;
  static double d94 = 94.0;
  static double d95 = 95.0;
  static double d96 = 96.0;
  static double d97 = 97.0;
  static double d98 = 98.0;
  static double d99 = 99.0;
  static double d100 = 100.0;
  static double d110 = 110.0;
  static double d120 = 120.0;
  static double d125 = 125.0;
  static double d130 = 130.0;
  static double d140 = 140.0;
  static double d150 = 150.0;
  static double d155 = 155.0;
  static double d160 = 160.0;
  static double d170 = 170.0;
  static double d175 = 175.0;
  static double d180 = 180.0;
  static double d190 = 190.0;
  static double d200 = 200.0;
  static double d210 = 210.0;
  static double d220 = 220.0;
  static double d230 = 230.0;
  static double d240 = 240.0;
  static double d250 = 250.0;
  static double d256 = 256.0;
  static double d260 = 260.0;
  static double d270 = 270.0;
  static double d280 = 280.0;
  static double d288 = 288.0;
  static double d290 = 290.0;
  static double d300 = 300.0;
  static double d320 = 320.0;
  static double d330 = 330.0;
  static double d340 = 340.0;
  static double d350 = 350.0;
  static double d353 = 353.0;
  static double d360 = 360.0;
  static double d370 = 370.0;
  static double d380 = 380.0;
  static double d390 = 390.0;
  static double d400 = 400.0;
  static double d410 = 410.0;
  static double d415 = 415.0;
  static double d420 = 420.0;
  static double d440 = 440.0;
  static double d450 = 450.0;
  static double d460 = 460.0;
  static double d470 = 470.0;
  static double d473 = 473.0;
  static double d480 = 480.0;
  static double d500 = 500.0;
  static double d570 = 570.0;
  static double d600 = 600.0;
  static double d620 = 620.0;

  static double d630 = 630.0;
  static double d635 = 635.0;
  static double d640 = 640.0;
  static double d650 = 650.0;
  static double d900 = 900.0;
}
