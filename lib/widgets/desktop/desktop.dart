import 'package:flutter/material.dart';
import 'package:portfolio/widgets/desktop/desktop_area.dart';
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
    return Stack(
      children: [
        const DesktopArea(),

        // 📌 Show Start Menu Above Everything
        if (isStartMenuOpen) const StartMenu(),

        // 🟢 Taskbar (Pass Toggle Function)
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: Taskbar(onStartPressed: _toggleStartMenu),
        ),
      ],
    );
  }
}
