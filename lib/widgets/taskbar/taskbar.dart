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
          colors: [Color(0xFF316AC5), Color(0xFF4A86E8)], // Matches inactive window buttons
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        children: [
          /// Windows XP Start Button (Flat on Left, Rounded on Right)
          GestureDetector(
            onTap: onStartPressed,
            child: Container(
              height: 36,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              margin: const EdgeInsets.only(left: 0, right: 4),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                gradient: const LinearGradient(
                  colors: [Color(0xFF29A329), Color(0xFF107C10)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: const Offset(2, 2),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/start_icon.png', height: 20),
                  const SizedBox(width: 6),
                  const Text(
                    'start',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Tahoma',
                      shadows: [
                        Shadow(
                          color: Colors.black45,
                          offset: Offset(1, 1),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
    
          /// Windows in Taskbar (Increased Width)
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: windows.map((window) {
                bool isActive = window == activeWindow;
                return GestureDetector(
                  onTap: () => onRestoreWindow(window),
                  child: Container(
                    height: 34, // Slightly taller
                    width: 160, // Increased width for better visibility
                    margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      gradient: LinearGradient(
                        colors: isActive
                            ? [Color(0xFF1C5C98), Color(0xFF3B75C6)]
                            : [Color(0xFF3E83EC), Color(0xFF3E83EC)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      border: Border.all(
                        color: Color(0xFF104E8B),
                        width: 1,
                      ),
                      boxShadow: isActive
                          ? [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                offset: Offset(2, 2),
                                blurRadius: 2,
                              ),
                            ]
                          : [],
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/my_computer_icon.png',
                          height: 18, // Slightly bigger
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            window.title,
                            style: const TextStyle(
                              fontSize: 13, // Slightly bigger
                              fontFamily: 'Tahoma',
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
    
          /// System Tray (Clock & Icons)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              color: Color(0xFF0A3D72),
              border: Border(
                left: BorderSide(color: Color(0xFF104E8B)),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.volume_up, color: Colors.white, size: 18),
                const SizedBox(width: 6),
                Icon(Icons.wifi, color: Colors.white, size: 18),
                const SizedBox(width: 6),
                Text(
                  '17:40',
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Tahoma',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
