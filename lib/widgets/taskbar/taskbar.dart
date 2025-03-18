import 'package:flutter/material.dart';

class Taskbar extends StatelessWidget {
  final VoidCallback onStartPressed; // Receive function from Desktop

  const Taskbar({super.key, required this.onStartPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1C5C98), Color(0xFF3B75C6)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        border: Border(
          top: BorderSide(color: Colors.white.withOpacity(0.3), width: 1),
          bottom: BorderSide(color: Colors.black.withOpacity(0.5), width: 2),
        ),
      ),
      child: Row(
        children: [
          // 🟢 START BUTTON
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: ElevatedButton(
              onPressed: onStartPressed, // 🔥 Call Toggle Function
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF169C20), // Green Start Button
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                ),
              ),
              child: Row(
                children: [
                  Image.asset('assets/images/start_icon.png', height: 20), // XP Start Icon
                  const SizedBox(width: 6),
                  const Text(
                    'Start',
                    style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

          const Spacer(),
          _taskbarClock(),
          const SizedBox(width: 12),
        ],
      ),
    );
  }

  // 🕒 Taskbar Clock
  Widget _taskbarClock() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        _getCurrentTime(),
        style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    return "${now.hour}:${now.minute.toString().padLeft(2, '0')} ${now.hour >= 12 ? 'PM' : 'AM'}";
  }
}
