import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'package:arslan_flutter_portfolio/core/cubits/resume_tab_cubit.dart';


import 'app.dart';
import 'features/portfolio/data/repositories/project_repository_impl.dart';
import 'features/portfolio/domain/usecases/get_all_projects.dart';
import 'features/portfolio/domain/usecases/get_project_by_id.dart';
import 'features/portfolio/presentation/bloc/project_bloc.dart';
import 'features/portfolio/presentation/bloc/project_event.dart'; // Your main App widget

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock orientation for web/mobile consistency
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Remove hash (#) from Flutter web URLs
  usePathUrlStrategy();

  // Initialize repositories and use cases
  final projectRepository = ProjectRepositoryImpl();
  final getAllProjects = GetAllProjects(projectRepository);
  final getProjectById = GetProjectById(projectRepository);

  runApp(
    MultiBlocProvider(
      providers: [
        // Resume Tab Cubit
        BlocProvider<ResumeTabCubit>(
          create: (_) => ResumeTabCubit(),
        ),

        // Project BLoC
        BlocProvider<ProjectBloc>(
          create: (_) => ProjectBloc(
            getAllProjects: getAllProjects,
            getProjectById: getProjectById,
          )..add(LoadAllProjects()),
        ),

        // You can add more BLoCs here as your app grows
      ],
      child: const MyApp(),
    ),
  );
}
