// project_state.dart

import 'package:equatable/equatable.dart';
import '../../domain/entity/entities.dart';

class ProjectState extends Equatable {
  final bool isLoading;
  final List<ProjectEntity> projects;
  final ProjectEntity? selectedProject;
  final String? errorMessage;

  const ProjectState({
    this.isLoading = false,
    this.projects = const [],
    this.selectedProject,
    this.errorMessage,
  });

  ProjectState copyWith({
    bool? isLoading,
    List<ProjectEntity>? projects,
    ProjectEntity? selectedProject,
    String? errorMessage,
  }) {
    return ProjectState(
      isLoading: isLoading ?? this.isLoading,
      projects: projects ?? this.projects,
      selectedProject: selectedProject ?? this.selectedProject,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    projects,
    selectedProject,
    errorMessage,
  ];
}
