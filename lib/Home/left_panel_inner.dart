import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/menu_provider.dart';
import 'provider/navigation_provider.dart';

class LeftPanelInner extends StatelessWidget {
  const LeftPanelInner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300), // Smooth animation
        width: MediaQuery.of(context).size.width * 0.2, // 20% of screen width
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10), // Rounded corners
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1),
          ],
        ),
        child: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              // Logo
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 5),
                child: Image.asset('assets/images/logo.png', height: 50),
              ),

              // Menu Items
              Expanded(
                child: Consumer<MenuProvider>(
                  builder: (context, menuProvider, child) {
                    return ListView(
                      children:
                          menuProvider.menuItems.asMap().entries.map((entry) {
                        int index = entry.key;
                        String title = entry.value['title'];
                        IconData icon =
                            entry.value['icon'] ?? Icons.menu; // Support icons

                        if (title == 'Courses') {
                          return ExpansionTile(
                            initiallyExpanded: true,
                            shape: const Border(
                              top: BorderSide(color: Colors.black12, width: 1),
                              bottom:
                                  BorderSide(color: Colors.black12, width: 1),
                            ),
                            leading:
                                const Icon(Icons.school, color: Colors.black54),
                            title: Text(title,
                                style: const TextStyle(color: Colors.black)),
                            children: [
                              _buildMenuItem('Course 1', Icons.book, context,
                                  'CoursesPage1', index),
                              _buildMenuItem('Course 2', Icons.book, context,
                                  'CoursesPage2', index),
                              _buildMenuItem('Course 3', Icons.book, context,
                                  'CoursesPage3', index),
                            ],
                          );
                        } else {
                          return _buildMenuItem(
                              title, icon, context, title, index);
                        }
                      }).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Menu Item Widget with Hover Effect
  Widget _buildMenuItem(String title, IconData icon, BuildContext context,
      String route, int index) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(title, style: const TextStyle(color: Colors.black)),
      hoverColor: Colors.blue.withOpacity(0.2), // Hover effect
      onTap: () {
        _onItemTapped(context, route, index);
        Navigator.of(context).pop(); // Close the drawer
      },
    );
  }

  // Function to Handle Navigation
  void _onItemTapped(BuildContext context, String pageName, int index) {
    Provider.of<NavigationProvider>(context, listen: false)
        .selectPage(index, pageName);
  }
}
