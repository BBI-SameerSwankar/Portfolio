import 'package:flutter/material.dart';

class ProjectsExplorer extends StatelessWidget {
  final List<Map<String, String>> projects; // List of projects (title + icon)

  const ProjectsExplorer({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   border: Border.all(color: Colors.grey.shade400),
      // ),
      child: Column(
        children: [
          // 🔵 XP Toolbar (Back, Forward, Search)
          // _buildToolbar(),

          // 📂 Main Folder View (Split into Sidebar & Content)
          Expanded(
            child: Row(
              children: [
                // 📌 Left Sidebar (Tasks Panel)
                // _buildSidebar(),

                // 📁 Right Content (Projects List)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // 3 columns for projects
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: projects.length,
                      itemBuilder: (context, index) {
                        return _buildProjectItem(
                          projects[index]['title']!,
                          projects[index]['icon']!,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔵 Windows XP Toolbar (Back, Forward, Search)
  Widget _buildToolbar() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFF3A81DD), // XP Blue Toolbar
        border: Border(bottom: BorderSide(color: Colors.grey.shade400)),
      ),
      child: Row(
        children: [
          _toolbarButton('assets/images/back.png'), // 🔙 Back
          _toolbarButton('assets/images/forward.png'), // 🔜 Forward
          _toolbarButton('assets/images/search.png'), // 🔍 Search
          const Spacer(),
          const Text(
            "My Projects",
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget _toolbarButton(String iconPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Image.asset(iconPath, width: 30, height: 30),
    );
  }

  // 📌 Windows XP Sidebar (Like "Folder Tasks" Panel)
  Widget _buildSidebar() {
    return Container(
      width: 150,
      color: const Color(0xFFE3F2FD), // XP Sidebar Light Blue
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sidebarItem('assets/images/folder_icon.png', 'New Folder'),
          _sidebarItem('assets/images/refresh.png', 'Refresh'),
          _sidebarItem('assets/images/delete.png', 'Delete'),
          _sidebarItem('assets/images/properties.png', 'Properties'),
        ],
      ),
    );
  }

  Widget _sidebarItem(String iconPath, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Image.asset(iconPath, width: 20, height: 20),
          const SizedBox(width: 10),
          Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  // 📁 Windows XP Folder Icons for Projects
  Widget _buildProjectItem(String title, String iconPath) {
    return Column(
      children: [
        Image.asset(iconPath, width: 50, height: 50),
        const SizedBox(height: 5),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
