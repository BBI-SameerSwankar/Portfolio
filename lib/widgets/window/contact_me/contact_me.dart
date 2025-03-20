import 'package:flutter/material.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 510,
      width: 700,
      child: Stack(
        children: [
          // Background: Internet Explorer UI
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/internet_explorer.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Contact Form Positioned in Place of Google Search
          Positioned(
            top: 120, // Adjusted to align with Google search bar in the image
            left: 120,
            right: 120, // Centered horizontally
            child: 
            Material(
              color: Colors.transparent, // Ensure no unwanted backgrounds
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title
                    const Text(
                      "Contact Me",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Tahoma',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Name Field
                    _buildXPInputField("Your Name"),
                    const SizedBox(height: 8),

                    // Email Field
                    _buildXPInputField("Your Email"),
                    const SizedBox(height: 8),

                    // Message Field
                    _buildXPInputField("Your Message", isMultiline: true),
                    const SizedBox(height: 12),

                    // Submit Button (XP-Style)
                    _buildXPButton("Send Message"),
                  ],
                ),
              ),
            ),
          
          
          ),
        ],
      ),
    );
  }

  // Windows XP Styled Input Field
  Widget _buildXPInputField(String hint, {bool isMultiline = false}) {
    return TextField(
      maxLines: isMultiline ? 3 : 1,
      style: const TextStyle(
        fontSize: 14,
        fontFamily: 'Tahoma',
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 13, color: Colors.black54),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  // Windows XP Styled Button
  Widget _buildXPButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        backgroundColor: Colors.grey.shade300,
        shadowColor: Colors.black.withOpacity(0.3),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2), // XP-style flat buttons
          side: const BorderSide(color: Colors.grey),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontFamily: 'Tahoma',
          color: Colors.black,
        ),
      ),
    );
  }
}
