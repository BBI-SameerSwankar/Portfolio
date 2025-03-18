import 'package:flutter/material.dart';

class WindowFrame extends StatefulWidget {
  final String title;
  final Widget child;

  const WindowFrame({super.key, required this.title, required this.child});

  @override
  _WindowFrameState createState() => _WindowFrameState();
}

class _WindowFrameState extends State<WindowFrame> {
  Offset position = const Offset(100, 100);
  bool isMaximized = false;
  Size windowSize = const Size(400, 300); // Default window size

  void _toggleMaximize() {
    final screenSize = MediaQuery.of(context).size;
    setState(() {
      isMaximized = !isMaximized;
      if (isMaximized) {
        position = Offset(0, 0);
        windowSize = Size(screenSize.width, screenSize.height - 40);
      } else {
        position = const Offset(100, 100);
        windowSize = const Size(400, 300);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          if (!isMaximized) {
            setState(() {
              double newX = position.dx + details.delta.dx;
              double newY = position.dy + details.delta.dy;

              final screenSize = MediaQuery.of(context).size;
              newX = newX.clamp(0, screenSize.width - windowSize.width);
              newY = newY.clamp(0, screenSize.height - windowSize.height - 40);

              position = Offset(newX, newY);
            });
          }
        },
        child: ClipRect(
          child: SizedBox(
            width: windowSize.width,
            height: windowSize.height,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                border: Border.all(
                  color: const Color(0xFF1B58B8), 
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    offset: const Offset(3, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF1B58B8), // Dark XP Blue
                          Color(0xFF3A81DD), // Light XP Blue
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      // borderRadius: BorderRadius.only(
                      //   topLeft: Radius.circular(5),
                      //   topRight: Radius.circular(5),
                      // ),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 6),
                        // 🖥 XP Window Icon
                        Image.asset(
                          'assets/images/my_computer_icon.png',
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 8),
                        // 📝 Window Title
                        Text(
                          widget.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Tahoma',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        // 🔘 XP-style Buttons (Smaller)
                        _buildXPButton('assets/images/minimize.png', () {}),
                        _buildXPButton(
                           
                                 'assets/images/maximize.png',
                            _toggleMaximize),
                        _buildXPCloseButton(),
                      ],
                    ),
                  ),
                  // 📌 Window Content
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(10),
                      child: widget.child,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  
  Widget _buildXPCloseButton() {
    return GestureDetector(
      onTap: () {}, // TODO: Handle Close Action
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          width: 28, // 📏 Smaller Size
          height: 28,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/images/cross.png'), // XP Close Button
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  // 🔳 XP Styled Minimize & Maximize Buttons (Smaller)
  Widget _buildXPButton(String assetPath, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          width: 28, // 📏 Smaller Size
          height: 28,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(assetPath), // Load XP Button Icons
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
