import 'package:flutter/material.dart';

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
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Inner shadow for depth
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          // 🖼 Profile Picture (XP Icon Style)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2), // White Border
                borderRadius: BorderRadius.circular(4), // XP Slightly Rounded
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(profileImage, fit: BoxFit.cover),
              ),
            ),
          ),

          // 📄 Text (Title like XP)
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Tahoma', // XP-like Font
            ),
          ),
        ],
      ),
    );
  }
}
