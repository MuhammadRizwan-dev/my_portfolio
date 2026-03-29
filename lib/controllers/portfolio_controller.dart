import 'package:flutter/material.dart';
import '../models/project_model.dart';

class PortfolioController {
  final String fullName = "MUHAMMAD RIZWAN";
  final String heroDescription = "Crafting Digital Solutions with Flutter & AI";
  final String email = "m.rizwandeveloper02@gmail.com";
  final String phone = "0313-5057231";
  final String location = "Rahim Yar Khan, Punjab, Pakistan";
  final List<SocialLinkModel> socialLinks = [
    SocialLinkModel(
      icon: Icons.code_rounded,
      label: "GitHub",
      url: "https://github.com/MuhammadRizwan-dev",
    ),
    SocialLinkModel(
      icon: Icons.person_search_rounded,
      label: "Fiverr",
      url: "https://www.fiverr.com/rizwan_studio_",
    ),
    SocialLinkModel(
      icon: Icons.link_rounded,
      label: "LinkedIn",
      url: "https://www.linkedin.com/in/muhammad-rizwan-developer",
    ),
    SocialLinkModel(
      icon: Icons.description_rounded,
      label: "Resume",
      url:
          "https://drive.google.com/file/d/1MDuCNywycySv9XGnJ9tYCUJpXWWFZSGA/view?usp=sharing",
    ),
  ];

  final List<ProjectModel> projects = [
    ProjectModel(
      title: "Fresh Grocery App",
      subtitle: "Full-stack Mobile App with Firebase Auth & Stripe Payments.",
      icon: Icons.shopping_cart_outlined,
      tags: ["Firebase", "Stripe", "Getx"],
      projectUrl: "https://github.com/MuhammadRizwan-dev/grocery_app",
    ),
    ProjectModel(
      title: "Task Reminder App",
      subtitle:
          "Local notifications & SQLite database for persistent task management.",
      icon: Icons.notifications_active_outlined,
      tags: ["SQLite", "Notifications", "Dart"],
      projectUrl: "https://github.com/MuhammadRizwan-dev/reminder_app",
    ),
    ProjectModel(
      title: "Admin Panel",
      subtitle: "Dedicated dashboard for managing products and orders.",
      icon: Icons.dashboard_customize_outlined,
      tags: ["Dashboard", "Admin", "Firebase"],
      projectUrl: '',
    ),
  ];

  final String aboutMe = """
I am a motivated 3rd-semester BSCS student and Flutter Developer from Rahim Yar Khan. 
I specialize in building full-stack applications with Firebase and Stripe. 
Currently, I am exploring AI automation with Python and advanced State Management in Flutter.
""";

  final List<Map<String, dynamic>> skills = [
    {"name": "Flutter", "icon": Icons.mobile_friendly},
    {"name": "Dart", "icon": Icons.code},
    {"name": "Firebase", "icon": Icons.cloud_done},
    {"name": "Python", "icon": Icons.terminal},
    {"name": "SQLite", "icon": Icons.storage},
    {"name": "Stripe", "icon": Icons.payments},
    {"name": "Java/C++", "icon": Icons.settings_suggest},
  ];

}
