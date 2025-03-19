import 'package:flutter/material.dart';

class Education extends StatelessWidget {
  const Education({super.key});

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

          // Search Results Section (Fully Covering Google Results Area)
          Positioned(
            top: 85, // Adjusted to align with Google search bar in the image
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
                      // Google Searched Keyword
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Showing results for ",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Tahoma',
                                color: Colors.black87,
                              ),
                            ),
                            TextSpan(
                              text: "Education details",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Tahoma',
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Search Results",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Tahoma',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 12),
                
                      // College Result
                      _buildSearchResult(
                        title: "Dr. D.Y. Patil Institute of Engineering, Management and Research",
                        imagePath: "assets/images/college.jpg",
                        link: "www.dypiemr.ac.in",
                        description:
                            "DYPIEMR is a premier institution known for its excellence in Computer Science and Engineering, providing industry-ready skills.",
                      ),
                      const SizedBox(height: 16),
                
                      // School Result
                      _buildSearchResult(
                        title: "Bharat Jr. College",
                        imagePath: "assets/images/jr_college.jpeg",
                        link: "www.abchighschool.edu",
                        description:
                            "ABC High School has a strong reputation in Mathematics and Science, fostering a robust academic foundation for students.",
                      ),
                      const SizedBox(height: 16),
                      
                      _buildSearchResult(
                        title: "Sant Sai High School",
                        imagePath: "assets/images/school.jpeg",
                        link: "www.abchighschool.edu",
                        description:
                            "ABC High School has a strong reputation in Mathematics and Science, fostering a robust academic foundation for students.",
                      ),
                      const SizedBox(height: 16),
                
                      // Related Searches (Mimicking Google UI)
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
                      _buildSearchSuggestion("Best Computer Science Universities"),
                      _buildSearchSuggestion("Top High Schools for Science Programs"),
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

  // Google-Style Search Result Entry
  Widget _buildSearchResult({
    required String title,
    required String imagePath,
    required String link,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Link (Mimicking Google)
        Text(
          link,
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Tahoma',
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 4),

        // Title
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Tahoma',
            fontWeight: FontWeight.bold,
            color: Colors.blue, // Mimicking old Google search result links
          ),
        ),
        const SizedBox(height: 4),

        // Row with Thumbnail and Description
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail Image
            Container(
              width: 100,
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
            const SizedBox(width: 12),

            // Description
            Expanded(
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Tahoma',
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Google-Style Related Search Suggestions
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
