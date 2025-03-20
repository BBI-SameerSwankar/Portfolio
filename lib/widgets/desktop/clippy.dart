import 'package:flutter/material.dart';

class Clippy extends StatefulWidget {
  const Clippy({super.key});

  @override
  State<Clippy> createState() => _XPClippyState();
}

class _XPClippyState extends State<Clippy> {
  bool _showTooltip = true;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      right: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (_showTooltip)
            _buildTooltip(),
          GestureDetector(
            onTap: () {
              setState(() {
                _showTooltip = !_showTooltip;
              });
            },
            child: Image.asset(
              'assets/images/clippy.png',
              width: 100,
              height: 100,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTooltip() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      constraints: const BoxConstraints(maxWidth: 220),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(2, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Have you tried clicking around? You might find some cool hidden surprises!",
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Tahoma',
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _showTooltip = false;
                  });
                },
                child: const Text("Close"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
