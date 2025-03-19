import 'package:flutter/material.dart';
import 'package:portfolio/provider/window_manager.dart';

class Taskbar extends StatelessWidget {
  final VoidCallback onStartPressed;
  final List<Window> windows;
  final Function(Window) onRestoreWindow;
  final Window? activeWindow;

  const Taskbar({
    super.key,
    required this.onStartPressed,
    required this.windows,
    required this.onRestoreWindow,
    required this.activeWindow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1C5C98), Color(0xFF3B75C6)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: ElevatedButton(
              onPressed: onStartPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF169C20),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              ),
              child: Row(
                children: [
                  Image.asset('assets/images/start_icon.png', height: 20),
                  const SizedBox(width: 6),
                  const Text(
                    'Start',
                    style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          for (var window in windows)
            GestureDetector(
              onTap: () => onRestoreWindow(window),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: window == activeWindow
                      ? Colors.blue.shade700
                      : Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  window.title,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
