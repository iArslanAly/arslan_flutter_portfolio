// project_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';

import 'project_event.dart';
import '../../domain/usecases/get_all_projects.dart';
import '../../domain/usecases/get_project_by_id.dart';
import 'project_states.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final GetAllProjects getAllProjects;
  final GetProjectById getProjectById;

  ProjectBloc({
    required this.getAllProjects,
    required this.getProjectById,
  }) : super(const ProjectState()) {
    on<LoadAllProjects>(_onLoadAllProjects);
    on<LoadProjectById>(_onLoadProjectById);
  }

  Future<void> _onLoadAllProjects(
      LoadAllProjects event, Emitter<ProjectState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final projects = await getAllProjects();
      emit(state.copyWith(isLoading: false, projects: projects));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: "Failed: $e"));
    }
  }

  Future<void> _onLoadProjectById(
      LoadProjectById event, Emitter<ProjectState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final project = await getProjectById(event.id);
      if (project != null) {
        emit(state.copyWith(isLoading: false, selectedProject: project));
      } else {
        emit(state.copyWith(isLoading: false, errorMessage: "Not found"));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: "Failed: $e"));
    }
  }
}
