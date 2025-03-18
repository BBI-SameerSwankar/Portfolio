import 'package:flutter/material.dart';

class DesktopIcons extends StatelessWidget {
  final List<Map<String, String>> icons;

  const DesktopIcons({super.key, required this.icons});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Padding(
        padding: const EdgeInsets.all(10), // Padding for desktop spacing
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 8, // 4 icons per row (adjustable)
            crossAxisSpacing: 30,
            mainAxisSpacing: 40,
            childAspectRatio: 0.8, // Ensures proper icon-title ratio
          ),
          itemCount: icons.length,
          itemBuilder: (context, index) {
            return _buildDesktopIcon(
              icons[index]['icon']!,
              icons[index]['title']!,
            );
          },
        ),
      ),
    );
  }

  // 🖥 Builds each XP-style desktop icon
  Widget _buildDesktopIcon(String iconPath, String title) {
    return Column(
      children: [
        // Icon
        Image.asset(iconPath, width: 48, height: 48), // Standard XP icon size
        const SizedBox(height: 5),

        // Title
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6), // XP Dark Background
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: 'Tahoma', // XP Font
            ),
          ),
        ),
      ],
    );
  }
}
