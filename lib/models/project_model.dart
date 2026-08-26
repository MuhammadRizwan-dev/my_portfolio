import 'package:flutter/material.dart';

class ProjectModel {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<String> tags;
  final String projectUrl;
  final List<String> images;
  final String demoUrl;
  final String apkUrl;
  final String webUrl;
  ProjectModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.tags,
    required this.projectUrl,
    required this.images,
    this.demoUrl = "",
    this.apkUrl = "",
    this.webUrl = "",
  });
}

class SocialLinkModel {
  final IconData icon;
  final String label;
  final String url;

  SocialLinkModel({required this.icon, required this.label, required this.url});
}