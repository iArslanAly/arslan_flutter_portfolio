// project_model.dart

import '../../domain/entity/entities.dart';

class ProjectModel extends ProjectEntity {
  ProjectModel({
    required super.id,
    required super.title,
    required super.category,
    required super.role,
    required super.client,
    required super.status,
    required super.duration,
    required super.postDate,
    required super.startDate,
    required super.endDate,
    required super.tools,
    required super.tags,
    required super.designLink,
    required super.apiLink,
    required super.links,
    required super.poster,
    required super.thumbnail,
    required super.overview,
    required super.features,
    required super.challenges,
    required super.solutions,
    required super.conclusion,
    required super.relatedProjects,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      category: json['category'] ?? '',
      role: json['role'] ?? '',
      client: json['client'] ?? '',
      status: json['status'] ?? '',
      duration: json['duration'] ?? '',
      postDate: json['post_date'] ?? '',
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
      tools: List<String>.from(json['tools'] ?? []),
      tags: List<String>.from(json['tags'] ?? []),
      designLink: json['design_link'] ?? '',
      apiLink: json['api_link'] ?? '',
      links: ProjectLinksModel.fromJson(json['links'] ?? {}),
      poster: json['poster'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      overview: json['overview'] ?? '',
      features: List<String>.from(json['features'] ?? []),
      challenges: List<String>.from(json['challenges'] ?? []),
      solutions: List<String>.from(json['solutions'] ?? []),
      conclusion: json['conclusion'] ?? '',
      relatedProjects: (json['related_projects'] as List? ?? [])
          .map((e) => RelatedProjectModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'role': role,
      'client': client,
      'status': status,
      'duration': duration,
      'post_date': postDate,
      'start_date': startDate,
      'end_date': endDate,
      'tools': tools,
      'tags': tags,
      'design_link': designLink,
      'api_link': apiLink,
      'links': (links as ProjectLinksModel).toJson(),
      'poster': poster,
      'thumbnail': thumbnail,
      'overview': overview,
      'features': features,
      'challenges': challenges,
      'solutions': solutions,
      'conclusion': conclusion,
      'related_projects': relatedProjects
          .map((e) => (e as RelatedProjectModel).toJson())
          .toList(),
    };
  }
}

class ProjectLinksModel extends ProjectLinksEntity {
  ProjectLinksModel({
    required super.github,
    required super.demoVideo,
    required super.playstore,
  });

  factory ProjectLinksModel.fromJson(Map<String, dynamic> json) {
    return ProjectLinksModel(
      github: json['github'] ?? '',
      demoVideo: json['demo_video'] ?? '',
      playstore: json['playstore'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'github': github, 'demo_video': demoVideo, 'playstore': playstore};
  }
}

class RelatedProjectModel extends RelatedProjectEntity {
  RelatedProjectModel({
    required super.id,
    required super.title,
    required super.thumbnail,
    required super.category,
  });

  factory RelatedProjectModel.fromJson(Map<String, dynamic> json) {
    return RelatedProjectModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      thumbnail:
          json['thumbnail'] ?? '', // flexible mapping
      category: json['category'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'thumbnail': thumbnail,
      'category': category,
    };
  }
}
