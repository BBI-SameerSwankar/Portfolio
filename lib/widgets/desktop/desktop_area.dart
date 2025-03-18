import 'package:flutter/material.dart';
import 'package:portfolio/widgets/window/projects/projects.dart';
import 'package:portfolio/widgets/window/widgets/window_frame.dart';
import 'package:portfolio/widgets/desktop/desktop_icons.dart';

class DesktopArea extends StatelessWidget {
  const DesktopArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Prevents overflow issues
      children: [
        // 🌄 XP Background
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/windows_bg.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        // 📂 Windows XP Desktop Icons (BEHIND WINDOWS)
        DesktopIcons(
          icons: [
            {'title': 'My Computer', 'icon': 'assets/images/my_computer_icon.png'},
            {'title': 'Resume', 'icon': 'assets/images/folder_icon.png'},
            // {'title': 'Recycle Bin', 'icon': 'assets/images/folder_icon.png'},
            // {'title': 'Network', 'icon': 'assets/images/folder_icon.png'},
          ],
        ),

        // 🗂 Window Frame (Windows appear on top of icons)
        WindowFrame(
          title: "Projects",
          child: ProjectsExplorer(
            projects: [
              {'title': 'EzShop Website', 'icon': 'assets/images/folder_icon.png'},
              {'title': 'LibMaster app', 'icon': 'assets/images/folder_icon.png'},
              {'title': 'Dhruva Website', 'icon': 'assets/images/folder_icon.png'},
            ],
          ),
        ),
      ],
    );
  }
}
