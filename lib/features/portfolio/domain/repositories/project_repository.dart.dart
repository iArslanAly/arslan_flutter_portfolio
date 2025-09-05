import '../entity/entities.dart';

abstract class ProjectRepository {
  Future<List<ProjectEntity>> getAllProjects();
  Future<ProjectEntity?> getProjectById(String id);
}
