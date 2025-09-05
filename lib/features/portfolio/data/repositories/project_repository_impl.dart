// project_repository_impl.dart (data/repositories)

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import '../../domain/entity/entities.dart';
import '../../domain/repositories/project_repository.dart.dart';
import '../modal/project_modal.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final String jsonPath;

  ProjectRepositoryImpl({this.jsonPath = 'assets/data/projects.json'});

  @override
  Future<List<ProjectEntity>> getAllProjects() async {
    final jsonString = await rootBundle.loadString(jsonPath);
    final List<dynamic> jsonList = json.decode(jsonString);

    return jsonList.map((e) => ProjectModel.fromJson(e)).toList();
  }

  @override
  Future<ProjectEntity?> getProjectById(String id) async {
    final projects = await getAllProjects();
    try {
      return projects.firstWhere((project) => project.id == id);
    } catch (_) {
      return null;
    }
  }
}
