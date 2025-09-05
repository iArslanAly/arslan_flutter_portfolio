// project_event.dart

import 'package:equatable/equatable.dart';

abstract class ProjectEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadAllProjects extends ProjectEvent {}

class LoadProjectById extends ProjectEvent {
  final String id;

  LoadProjectById(this.id);

  @override
  List<Object?> get props => [id];
}
