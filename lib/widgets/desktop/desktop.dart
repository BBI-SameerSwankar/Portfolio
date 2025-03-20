import 'package:flutter/material.dart';
import 'package:portfolio/provider/window_manager.dart';
import 'package:portfolio/widgets/desktop/clippy.dart';
import 'package:portfolio/widgets/desktop/desktop_icons.dart';
import 'package:portfolio/widgets/window/projects/projects.dart';
import 'package:portfolio/widgets/window/widgets/window_frame.dart';
import 'package:provider/provider.dart';
import 'package:portfolio/widgets/taskbar/taskbar.dart';
import 'package:portfolio/widgets/start_menu/start_menu.dart';

class Desktop extends StatefulWidget {
  const Desktop({super.key});

  @override
  _DesktopState createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  bool isStartMenuOpen = false;

  void _toggleStartMenu() {
    setState(() {
      isStartMenuOpen = !isStartMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final windowManager = Provider.of<WindowManager>(context);

      List<Window> nonMinimizedWindows = windowManager.windows.where((w) => !w.isMinimized).toList();

// Sort so the active window appears last (on top)
nonMinimizedWindows.sort((a, b) => a == windowManager.activeWindow ? 1 : -1);


    return Material(
      child: Stack(
        children: [
          // 🌄 XP Desktop Background
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
      
      
            DesktopIcons(
            icons: [
              {'title': 'My Computer', 'icon': 'assets/images/my_computer_icon.png'},
              {'title': 'Resume', 'icon': 'assets/images/folder_icon.png'},
              // {'title': 'Recycle Bin', 'icon': 'assets/images/folder_icon.png'},
              // {'title': 'Network', 'icon': 'assets/images/folder_icon.png'},
            ],
          ),
      
      
          Clippy(),
      
          // 🗂 Show ONLY non-minimized windows (order maintained)
       for (var window in nonMinimizedWindows)
        WindowFrame(
      key: ValueKey(window.title),
      title: window.title,
      child: window.child,
        ),
      
          // 🟢 Start Menu
          if (isStartMenuOpen)
            StartMenu(
              onOpenFolder: (title, content) {
                windowManager.openWindow(title, content);
                _toggleStartMenu();
              },
            ),
      
          // 🖥 Taskbar (Shows minimized windows)
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Taskbar(
              onStartPressed: _toggleStartMenu,
              windows: windowManager.windows,
              onRestoreWindow: windowManager.restoreWindow,
              activeWindow: windowManager.activeWindow,
            ),
          ),
        ],
      ),
    );
  }
}
