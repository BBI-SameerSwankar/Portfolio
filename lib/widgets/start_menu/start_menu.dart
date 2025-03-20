import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/widgets/window/contact_me/contact_me.dart';
import 'package:portfolio/widgets/window/education/education.dart';
import 'package:portfolio/widgets/window/experience/experience.dart';

class StartMenu extends StatelessWidget {
  final Function(String, Widget) onOpenFolder;

  const StartMenu({super.key, required this.onOpenFolder});

  @override
  Widget build(BuildContext context) {


     final List<String> skills = const [
    "html.png", "css.png", "mysql.png",
    "git.png", "github.png",  "apple.png", "android.png", "swift.png"
  ];

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
                          _startMenuItem('assets/images/folder_icon.png', 'My Projects', () {
                            onOpenFolder(
                              "My Projects",
                              Center(child: Text("📁 This is My Projects Folder")),
                            );
                          }),
                          _startMenuItem('assets/images/folder_icon.png', 'Education', () {
                            onOpenFolder(
                              "Education",
                              Education(),
                            );
                          }),
                          _startMenuItem('assets/images/folder_icon.png', 'Experience', () {
  onOpenFolder(
    "Experience",
    Experience(
    ),
  );
}),

                          
                          _startMenuItem('assets/images/folder_icon.png', 'Contact Me', () {
                            onOpenFolder(
                              "Contact Me",
                              ContactMe(),
                            );
                          }),
                        ],
                      ),
                    ),


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

            // 🛠 GridView for skills
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // 4 icons per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1, // Keep icons square
                ),
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    "assets/images/skills/${skills[index]}",
                    width: 50,
                    height: 50,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),

                    // 🔹 Right Panel (Skill Icons Grid)
                    // Expanded(
                    //   child: Container(
                    //     color: Colors.white,
                    //     padding: const EdgeInsets.all(10),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         const Text(
                    //           "Skills",
                    //           style: TextStyle(
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.bold,
                    //             fontFamily: 'Tahoma',
                    //           ),
                    //         ),
                    //         const SizedBox(height: 8),
                    //         SvgPicture.network(
                    //           "https://skillicons.dev/icons?i=html,css,js,c,cpp,mysql,git,github,figma,vscode,androidstudio,firebase,nodejs,express,mongodb",
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                
                
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
                    child: _startMenuItem('assets/images/shutdown.png', 'Shut Down', () {}),
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
  Widget _startMenuItem(String iconPath, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          children: [
            Image.asset(iconPath, width: 22, height: 22),
            const SizedBox(width: 12),
            Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}

class XPProfileHeader extends StatelessWidget {
  final String title;
  final String profileImage;

  const XPProfileHeader({
    super.key,
    required this.title,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1B58B8), Color(0xFF3A81DD)], // XP Glossy Blue
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(6), // XP-style rounded corners
        border: Border.all(color: Colors.white, width: 1), // Outer light border
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(profileImage, fit: BoxFit.cover),
              ),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Tahoma',
            ),
          ),
        ],
      ),
    );
  }
}
