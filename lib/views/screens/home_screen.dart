import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controllers/portfolio_controller.dart';
import '../widgets/available_badge.dart';
import '../widgets/contact_card.dart';
import '../widgets/profile_photo.dart';
import '../widgets/projects_grid.dart';
import '../widgets/robot_buddy.dart';
import '../widgets/social_button.dart';
import '../widgets/stat_badge.dart';
import '../widgets/typing_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PortfolioController();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "RIZWAN.DEV",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryBlue,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(size.width < 600 ? 20 : 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

              // LayoutBuilder(
              //   builder: (context, constraints) {
              //     bool isDesktop = constraints.maxWidth > 900;
              //     return Row(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Expanded(
              //           flex: 3,
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               ShaderMask(
              //                 shaderCallback: (bounds) => const LinearGradient(
              //                   colors: AppColors.heroGradient,
              //                 ).createShader(bounds),
              //                 child: Text(
              //                   controller.fullName,
              //                   style: TextStyle(
              //                     fontSize: isDesktop ? 55 : 40,
              //                     fontWeight: FontWeight.bold,
              //                     color: AppColors.textWhite,
              //                     letterSpacing: -1,
              //                   ),
              //                 ),
              //               ),
              //               Text(
              //                 controller.heroDescription,
              //                 style: TextStyle(
              //                   fontSize: isDesktop ? 22 : 18,
              //                   color: AppColors.textGrey,
              //                   fontWeight: FontWeight.w300,
              //                 ),
              //               ),
              //               const SizedBox(height: 25),
              //               Wrap(
              //                 spacing: 25,
              //                 runSpacing: 20,
              //                 children: controller.socialLinks
              //                     .map((link) => SocialButton(link: link))
              //                     .toList(),
              //               ),
              //             ],
              //           ),
              //         ),
              //         if (isDesktop)
              //           const Expanded(
              //             flex: 1,
              //             child: Center(child: RobotBuddy(size: 200)),
              //           ),
              //       ],
              //     );
              //   },
              // ),
              // if (size.width <= 900)
              //   const Center(
              //     child: Padding(
              //       padding: EdgeInsets.only(top: 50),
              //       child: RobotBuddy(size: 160),
              //     ),
              //   ),
              if (size.width <= 900)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ProfilePhoto(size: 100),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ),
                ),
              LayoutBuilder(
                builder: (context, constraints) {
                  bool isDesktop = constraints.maxWidth > 900;
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      if (isDesktop)
                        Expanded(
                          flex: 2,
                          child: Center(child: ProfilePhoto()),
                        ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            ShaderMask(
                              shaderCallback: (bounds) => const LinearGradient(
                                colors: AppColors.heroGradient,
                              ).createShader(bounds),
                              child: Text(
                                controller.fullName,
                                style: TextStyle(
                                  fontSize: isDesktop ? 55 : 40,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textWhite,
                                  letterSpacing: -1,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            TypingText(
                              texts: const [
                                "Flutter Developer",
                                "Firebase Expert",
                                "Freelancer",
                              ],
                              style: TextStyle(
                                fontSize: isDesktop ? 22 : 18,
                                color: AppColors.primaryBlue,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              controller.heroDescription,
                              style: TextStyle(
                                fontSize: isDesktop ? 16 : 14,
                                color: AppColors.textGrey,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Row(
                              children: [
                                StatBadge(number: "6+", label: "Projects"),
                                SizedBox(width: 20),
                                StatBadge(number: "3+", label: "Yrs Exp"),
                                SizedBox(width: 20),
                                StatBadge(number: "2", label: "Clients"),
                              ],
                            ),

                            const SizedBox(height: 25),
                            const AvailableBadge(),
                          const SizedBox(height: 10,),
                            Wrap(
                              spacing: 25,
                              runSpacing: 20,
                              children: controller.socialLinks
                                  .map((link) => SocialButton(link: link))
                                  .toList(),
                            ),
                          ],
                        ),
                      ),

                      if (isDesktop)
                        const Expanded(
                          flex: 1,
                          child: Center(child: RobotBuddy(size: 180)),
                        ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 100),
              const Text(
                "My Projects",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textWhite,
                ),
              ),
              const SizedBox(height: 20),

              DefaultTabController(
                length: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                      isScrollable: true,
                      indicatorColor: AppColors.primaryBlue,
                      labelColor: AppColors.primaryBlue,
                      unselectedLabelColor: AppColors.textGrey,
                      tabs: [
                        Tab(text: "All Projects"),
                        Tab(text: "Built from Scratch"),
                        Tab(text: "Major Enhancements"),
                      ],
                    ),
                    const SizedBox(height: 30),

                    SizedBox(
                      height:
                          800,
                      child: TabBarView(
                        children: [
                          ProjectsGrid(projects: controller.projects),
                          ProjectsGrid(projects: controller.myOwnProjects),
                          ProjectsGrid(projects: controller.enhancedProjects),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                "About Me",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textWhite,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Text(
                  controller.aboutMe,
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.textGrey,
                    height: 1.6,
                  ),
                ),
              ),

              const SizedBox(height: 80),

              const Text(
                "Technical Skills",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textWhite,
                ),
              ),
              const SizedBox(height: 30),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: controller.skills.map((skill) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.cardBg,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: AppColors.primaryBlue.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          skill['icon'],
                          color: AppColors.primaryBlue,
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          skill['name'],
                          style: const TextStyle(
                            color: AppColors.textWhite,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 80),

              const Text(
                "Get In Touch",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textWhite,
                ),
              ),
              const SizedBox(height: 30),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  ContactCard(
                    icon: Icons.email_outlined,
                    title: "Email Me",
                    value: controller.email,
                    onTap: () =>
                        launchUrl(Uri.parse("mailto:${controller.email}")),
                  ),
                  ContactCard(
                    icon: Icons.phone_android_outlined,
                    title: "WhatsApp / Call",
                    value: controller.phone,
                    onTap: () => launchUrl(
                      Uri.parse(
                        "https://wa.me/${controller.phone.replaceAll('-', '')}",
                      ),
                    ),
                  ),
                  ContactCard(
                    icon: Icons.location_on_outlined,
                    title: "Location",
                    value: controller.location,
                  ),
                ],
              ),

              const SizedBox(height: 100),
              const Divider(color: Colors.white10, height: 100),

              Center(
                child: Column(
                  children: [
                    const Text(
                      "Built with ❤️ using Flutter",
                      style: TextStyle(color: AppColors.textGrey, fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "© 2026 Muhammad Rizwan. All Rights Reserved.",
                      style: TextStyle(
                        color: AppColors.textGrey,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
