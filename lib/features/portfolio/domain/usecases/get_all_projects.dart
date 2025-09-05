import '../entity/entities.dart';
import '../repositories/project_repository.dart.dart';

class GetAllProjects {
  final ProjectRepository repository;

  GetAllProjects(this.repository);

  Future<List<ProjectEntity>> call() async {
    return await repository.getAllProjects();
  }
}
