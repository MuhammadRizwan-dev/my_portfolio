import 'package:flutter/material.dart';
import '../../models/project_model.dart';
import 'project_card.dart';

class ProjectsGrid extends StatelessWidget {
  final List<ProjectModel> projects;

  const ProjectsGrid({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 25,
        runSpacing: 25,
        children: projects.map((p) => ProjectCard(
          title: p.title,
          subtitle: p.subtitle,
          icon: p.icon,
          tags: p.tags,
          projectUrl: p.projectUrl,
          images: p.images,
        )).toList(),
      ),
    );
  }
}