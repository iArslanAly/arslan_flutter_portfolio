import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'package:arslan_flutter_portfolio/core/cubits/resume_tab_cubit.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  usePathUrlStrategy();
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ResumeTabCubit())],
      child: const MyApp(),
    ),
  );
}
