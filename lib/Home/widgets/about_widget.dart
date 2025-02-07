import 'package:flutter/material.dart';
import '../../data/about_us.dart';

class AboutWidget extends StatefulWidget {
  const AboutWidget({super.key});

  @override
  State<AboutWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage('assets/images/home_bg.jpg'), // Background image
            fit: BoxFit.cover, // Stretch the image to fill the screen
          ),
        ),
        child: Stack(
          children: [
            // Dark Overlay to make text more readable
            Container(
              decoration: BoxDecoration(
                color:
                    Colors.black.withOpacity(0.7), // Dark overlay with opacity
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Main Heading
                  Text(
                    'NAVAL GROUP - ABOUT US',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2.0,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black54,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),

                  // Brief Intro
                  Text(
                    'Welcome to NAVAL Group. We are a global leader in marine engineering, '
                    'providing cutting-edge solutions for naval defense and maritime security.',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white, // Bright white for better contrast
                      height: 1.5,
                      fontWeight:
                          FontWeight.bold, // Make text bold for more emphasis
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(
                              0.6), // Dark shadow for better contrast
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 50),

                  // Grid Layout of Sections (2 per row)
                  GridView.builder(
                    itemCount: AboutData.sections.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width > 600
                          ? 2
                          : 1, // Responsive design: 2 boxes in wide screens, 1 in narrow
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio:
                          1.5, // Adjust the aspect ratio for the card-style layout
                    ),
                    itemBuilder: (context, index) {
                      var section = AboutData.sections[index];
                      IconData iconData =
                          Icons.help; // Default icon if not found
                      switch (section['icon']) {
                        case 'Icons.military_tech':
                          iconData = Icons.military_tech;
                          break;
                        case 'Icons.engineering':
                          iconData = Icons.engineering;
                          break;
                        case 'Icons.public':
                          iconData = Icons.public;
                          break;
                        case 'Icons.science':
                          iconData = Icons.science;
                          break;
                        case 'Icons.security':
                          iconData = Icons.security;
                          break;
                        default:
                          iconData = Icons.help;
                          break;
                      }

                      return _buildSection(
                        title: section['title']!,
                        content: section['content']!,
                        icon: iconData,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Section Builder (Modern Windows 10-inspired design)
  Widget _buildSection({
    required String title,
    required String content,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black
            .withOpacity(0.6), // Slight transparency for modern effect
        borderRadius: BorderRadius.circular(10),
        border:
            Border.all(color: Colors.blueAccent, width: 1.5), // Subtle border
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10.0,
            offset: Offset(0, 5), // Soft shadow for depth
          ),
        ],
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Icon(icon, color: Colors.blueAccent, size: 50),
          SizedBox(height: 15),
          Text(
            title,
            style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(fontSize: 18, color: Colors.white70, height: 1.5),
          ),
        ],
      ),
    );
  }
}
