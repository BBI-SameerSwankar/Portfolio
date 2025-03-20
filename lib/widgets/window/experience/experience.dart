import 'package:flutter/material.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     height: 510,
      width: 700,
      child: Stack(
        children: [
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
          Positioned(
            top: 85,
            left: 0,
            right: 0,
            bottom: 0,
            child: Material(
              color: Colors.transparent,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Search Results",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Tahoma',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildSearchResult(
                        title: "Borm Bruckmeier Infotech India Pvt. Ltd.",
                        role: "Junior Software Developer",
                        duration: "Oct 2024 – Present",
                        description: "Developing scalable applications, optimizing backend logic, and improving UI/UX in Flutter for better user experience.",
                      ),
                      const SizedBox(height: 12),
                      _buildSearchResult(
                        title: "Equip9 Internet Pvt. Ltd.",
                        role: "Full Stack Software Development Intern",
                        duration: "Dec 2021 – July 2022",
                        description: "Developed subscription module UI using React Native. Built an internal admin tool with CodeIgniter3 and MySQL, saving 15 min per query task for SDEs.",
                      ),
                      const SizedBox(height: 16),
                      const Divider(color: Colors.grey),
                      const SizedBox(height: 8),
                      const Text(
                        "Related searches",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Tahoma',
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 6),
                      _buildSearchSuggestion("Best Flutter Developer Practices"),
                      _buildSearchSuggestion("Top Backend Technologies 2025"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResult({
    required String title,
    required String role,
    required String duration,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Tahoma',
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          role,
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Tahoma',
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(
          duration,
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Tahoma',
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Tahoma',
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchSuggestion(String query) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 4.0),
      child: Row(
        children: [
          const Icon(Icons.search, size: 14, color: Colors.blue),
          const SizedBox(width: 6),
          Text(
            query,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Tahoma',
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
