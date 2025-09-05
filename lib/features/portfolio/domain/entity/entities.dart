class ProjectEntity {
  final String id;
  final String title;
  final String category;
  final String role;
  final String client;
  final String status;
  final String duration;
  final String postDate;
  final String startDate;
  final String endDate;
  final List<String> tools;
  final List<String> tags;
  final String designLink;
  final String apiLink;
  final ProjectLinksEntity links;
  final String poster;
  final String thumbnail;
  final String overview;
  final List<String> features;
  final List<String> challenges;
  final List<String> solutions;
  final String conclusion;
  final List<RelatedProjectEntity> relatedProjects;

  ProjectEntity({
    required this.id,
    required this.title,
    required this.category,
    required this.role,
    required this.client,
    required this.status,
    required this.duration,
    required this.postDate,
    required this.startDate,
    required this.endDate,
    required this.tools,
    required this.tags,
    required this.designLink,
    required this.apiLink,
    required this.links,
    required this.poster,
    required this.thumbnail,
    required this.overview,
    required this.features,
    required this.challenges,
    required this.solutions,
    required this.conclusion,
    required this.relatedProjects,
  });
}

class ProjectLinksEntity {
  final String github;
  final String demoVideo;
  final String playstore;

  ProjectLinksEntity({
    required this.github,
    required this.demoVideo,
    required this.playstore,
  });
}

class RelatedProjectEntity {
  final String id;
  final String title;
  final String thumbnail;
  final String category;

  RelatedProjectEntity({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.category,
  });
}
