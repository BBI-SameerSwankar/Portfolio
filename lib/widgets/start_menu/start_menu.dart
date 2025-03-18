import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/widgets/start_menu/profile_header.dart';

class StartMenu extends StatelessWidget {
  const StartMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 5,
      bottom: 45,
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(5),
        child: Container(
          width: 320,
          height: 450,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 5,
                offset: const Offset(3, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              // XP Profile Header
              const XPProfileHeader(
                title: "Sameer Swankar",
                profileImage: 'assets/images/start_icon.png',
              ),

              // 📂 Start Menu Content
              Expanded(
                child: Row(
                  children: [
                    // 🔹 Left Panel (Programs & Shortcuts)
                    Container(
                      width: 140,
                      color: const Color(0xFFDEEAF6),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _startMenuItem('assets/images/folder_icon.png', 'My Projects'),
                          _startMenuItem('assets/images/folder_icon.png', 'Education'),
                          _startMenuItem('assets/images/folder_icon.png', 'Experience'),
                          _startMenuItem('assets/images/folder_icon.png', 'Contact me'),
                        ],
                      ),
                    ),

                    // 🔹 Right Panel (Skill Icons Grid)
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Skills",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Tahoma',
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Expanded(
                            //   child: GridView.builder(
                            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            //       crossAxisCount: 4, // 4 columns
                            //       crossAxisSpacing: 10,
                            //       mainAxisSpacing: 10,
                            //     ),
                            //     itemCount: skillIcons.length,
                            //     itemBuilder: (context, index) {
                            //       return _buildSkillIcon(skillIcons[index]);
                            //     },
                            //   ),
                            // ),
                            SvgPicture.network("https://skillicons.dev/icons?i=html,css,js,c,cpp,mysql,git,github,figma,vscode,androidstudio,firebase,nodejs,express,mongodb"),
                            // Image(
                            //   image: NetworkImage("https://skillicons.dev/icons?i=html,css,js,c,cpp,mysql,git,github,figma,vscode,androidstudio,firebase,nodejs,express,mongodb"),
                              
                            // )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // 🔴 XP Shut Down Button (Bottom)
              Container(
                height: 50,
                decoration: const BoxDecoration(
                  color: Color(0xFFDEEAF6),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: _startMenuItem('assets/images/shutdown.png', 'Shut Down'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 📌 Windows XP Start Menu Items
  Widget _startMenuItem(String iconPath, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Image.asset(iconPath, width: 22, height: 22),
          const SizedBox(width: 12),
          Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  // 📌 Skill Icons Grid Item (Using `flutter_svg`)
  Widget _buildSkillIcon(String url) {
  return Image.network(
    "$url&theme=light&format=png", // Forces PNG format
    width: 40,
    height: 40,
    errorBuilder: (context, error, stackTrace) {
      print(error.toString());
      return Container(
        width: 40,
        height: 40,
        color: Colors.grey.shade300,
        child: const Icon(Icons.broken_image, color: Colors.grey),
      );
    },
  );
}

}

// 🔹 List of Skill Icons from skillicons.dev (SVG format)
final List<String> skillIcons = [
  "https://skillicons.dev/icons?i=html",
  "https://skillicons.dev/icons?i=css",
  "https://skillicons.dev/icons?i=js",
  "https://skillicons.dev/icons?i=c",
  "https://skillicons.dev/icons?i=cpp",
  "https://skillicons.dev/icons?i=mysql",
  "https://skillicons.dev/icons?i=git",
  "https://skillicons.dev/icons?i=github",
  "https://skillicons.dev/icons?i=figma",
  "https://skillicons.dev/icons?i=vscode",
  "https://skillicons.dev/icons?i=androidstudio",
  "https://skillicons.dev/icons?i=firebase",
  "https://skillicons.dev/icons?i=nodejs",
  "https://skillicons.dev/icons?i=express",
  "https://skillicons.dev/icons?i=mongodb",
  "https://skillicons.dev/icons?i=flutter",
  "https://skillicons.dev/icons?i=dart",
  "https://skillicons.dev/icons?i=postman",
  "https://skillicons.dev/icons?i=typescript",
  "https://skillicons.dev/icons?i=react",
  "https://skillicons.dev/icons?i=redux",
  "https://skillicons.dev/icons?i=next",
];

