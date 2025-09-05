// get_project_by_id.dart (domain/usecases)

import '../entity/entities.dart';
import '../repositories/project_repository.dart.dart';

class GetProjectById {
  final ProjectRepository repository;

  GetProjectById(this.repository);

  Future<ProjectEntity?> call(String id) async {
    return await repository.getProjectById(id);
  }
}
