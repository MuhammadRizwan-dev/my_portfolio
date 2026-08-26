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
  List<ProjectModel> get projects => [...myOwnProjects, ...enhancedProjects];
  final List<ProjectModel> myOwnProjects = [
    ProjectModel(
      title: "Fresh Grocery App",
      subtitle: "Full-stack Mobile App with Firebase Auth & Stripe Payments.",
      icon: Icons.shopping_cart_outlined,
      tags: ["Firebase", "Stripe", "Getx"],
      projectUrl: "https://github.com/MuhammadRizwan-dev/grocery_app",
      images: [
        "assets/images/grocery_app/nectar_app_ss1.png",
        "assets/images/grocery_app/nectar_app_ss2.png",
        "assets/images/grocery_app/nectar_app_ss3.png",
        "assets/images/grocery_app/nectar_app_ss4.png",
        "assets/images/grocery_app/nectar_app_ss5.png",
        "assets/images/grocery_app/nectar_app_ss6.png",
        "assets/images/grocery_app/nectar_app_ss7.png",
        "assets/images/grocery_app/nectar_app_ss8.png",
        "assets/images/grocery_app/nectar_app_ss9.png",
        "assets/images/grocery_app/nectar_app_ss10.png",
        "assets/images/grocery_app/nectar_app_ss11.png",
        "assets/images/grocery_app/nectar_app_ss12.png",
        "assets/images/grocery_app/nectar_app_13.png",
      ],
      demoUrl: "https://youtu.be/CUxGNavEWdY",
      apkUrl: "https://github.com/MuhammadRizwan-dev/grocery_app/releases/latest/download/grocery_app.apk",
    ),
    ProjectModel(
      title: "Task Reminder App",
      subtitle:
      "Local notifications & SQLite database for persistent task management.",
      icon: Icons.notifications_active_outlined,
      tags: ["SQLite", "Notifications", "Dart"],
      projectUrl: "https://github.com/MuhammadRizwan-dev/reminder_app",
      images: [
        "assets/images/reminder_app/reminder_app_ss1.png",
        "assets/images/reminder_app/reminder_app_ss2.png",
      ],
      demoUrl: "https://youtube.com/shorts/_BT8ldwHj04?feature=share",
      apkUrl: "https://github.com/MuhammadRizwan-dev/reminder_app/releases/latest/download/reminder_app.apk",
    ),
    ProjectModel(
      title: "Admin Panel",
      subtitle: "Dedicated dashboard for managing products and orders.",
      icon: Icons.dashboard_customize_outlined,
      tags: ["Dashboard", "Admin", "Firebase"],
      projectUrl: '',
      images: [
        "assets/images/admin_pannel/admin_pannel_ss1.png",
        "assets/images/admin_pannel/admin_pannel_ss2.png",
        "assets/images/admin_pannel/admin_panel_ss3.png",
      ],
      demoUrl: "https://youtube.com/shorts/uLNSolZmGgU?feature=share",
      webUrl: "",
    ),
    ProjectModel(
      title: "Exam Master (Hybrid)",
      subtitle:
      "Smart MCQ engine with offline mode and serverless chat integration.",
      icon: Icons.school_rounded,
      tags: ["Offline Mode", "Dual-Mode UI", "Google Sheets API"],
      projectUrl: '',
      images: [
        "assets/images/exam_master_app/exam_master_ss1.png",
        "assets/images/exam_master_app/exam_master_ss2.png",
        "assets/images/exam_master_app/exam_master_ss3.png",
        "assets/images/exam_master_app/exam_master_ss4.png",
        "assets/images/exam_master_app/exam_master_ss5.png",
        "assets/images/exam_master_app/exam_master_ss6.png",
        "assets/images/exam_master_app/exam_master_ss7.png",
      ],
      demoUrl: "https://youtube.com/shorts/29LJPQXyg0U?feature=share",
    ),
  ];
  final List<ProjectModel> enhancedProjects = [
    ProjectModel(
      title: "WhatsApp Scheduler",
      subtitle:
      "A smart automation tool with custom background services, real-time Firestore sync, and intelligent scheduling logic.",
      icon: Icons.schedule_send_rounded,
      tags: [
        "Background Tasks",
        "Exact Alarms",
        "Firestore Streams",
        "Smart UI",
      ],
      projectUrl: '',
      images: [],
      demoUrl: "https://youtube.com/shorts/Y7cpSqCVF38?feature=share",
    ),
    ProjectModel(
      title: "Al-Quran Digital",
      subtitle:
      "A professional Islamic app featuring synchronized audio recitations, automated playlist streaming, and a personalized bookmarking system.",
      icon: Icons.menu_book_rounded,
      tags: [
        "Audio Streaming",
        "Playlist Logic",
        "UI-Audio Sync",
        "GetX State",
      ],
      projectUrl: '',
      images: [
        "assets/images/al_quran_app/quran_app_ss1.jpeg",
        "assets/images/al_quran_app/quran_app_ss2.png",
        "assets/images/al_quran_app/quran_app_ss3.png",
        "assets/images/al_quran_app/quran_app_ss4.png",
        "assets/images/al_quran_app/quran_app_ss5.png",
        "assets/images/al_quran_app/quran_app_ss6.png",
        "assets/images/al_quran_app/quran_app_ss7.png",
        "assets/images/al_quran_app/quran_app_ss8.png",
        "assets/images/al_quran_app/quran_app_ss9.png",
        "assets/images/al_quran_app/quran_app_ss10.png",
        "assets/images/al_quran_app/quran_app_ss11.png",
        "assets/images/al_quran_app/quran_app_ss12.png",
        "assets/images/al_quran_app/quran_app_ss13.png",
        "assets/images/al_quran_app/quran_app_ss14.png",
        "assets/images/al_quran_app/quran_app_ss15.png",
        "assets/images/al_quran_app/quran_app_ss16.png",
      ],
      demoUrl: "https://youtu.be/np0RuSgMr_c",
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