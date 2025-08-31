import 'dart:ui';

/// Simple data model for each showcased project.
class Project {
  final String imagePath;
  final String title;
  final String tech;
  final VoidCallback? onTap;

  const Project({
    required this.imagePath,
    required this.title,
    required this.tech,
    this.onTap,
  });
}
