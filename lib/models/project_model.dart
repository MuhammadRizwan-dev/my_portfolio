import 'package:flutter/material.dart';

class ProjectModel {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<String> tags;
  final String projectUrl;

  ProjectModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.tags,
    required this.projectUrl
  });
}

class SocialLinkModel {
  final IconData icon;
  final String label;
  final String url;

  SocialLinkModel({
    required this.icon,
    required this.label,
    required this.url,
  });
}