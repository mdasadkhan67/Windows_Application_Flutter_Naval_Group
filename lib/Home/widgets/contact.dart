import 'package:flutter/material.dart';

class ContactWidget extends StatefulWidget {
  const ContactWidget({super.key});

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.all(10.0), // Increased padding for spacious design
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image:
                  AssetImage('assets/images/home_bg.jpg'), // Background image
              fit: BoxFit.cover, // Stretch the image to fill the screen
            ),
          ),
          child: Stack(
            children: [
              // Dark Overlay to make text more readable
              Container(
                decoration: BoxDecoration(
                  color: Colors.black
                      .withOpacity(0.6), // Semi-transparent dark overlay
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Header: VIP welcome message
                    Text(
                      'Contact Us',
                      style: TextStyle(
                        fontSize: 60, // Larger font size for better impact
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2.0,
                        shadows: [
                          Shadow(
                            blurRadius: 15.0,
                            color: Colors.black.withOpacity(0.7),
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // Subtitle: A refined and exclusive invitation message
                    Text(
                      'Prepare for a life-changing journey in mastering the art of navigating the high seas.',
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black.withOpacity(0.6),
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40),
                    // Contact Us Headline
                    Text(
                      'Reach Out to Us',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.5,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black.withOpacity(0.6),
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // Contact Information
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Phone Number
                          Text(
                            '📞 Phone: +1 (555) 123-4567',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              shadows: [
                                Shadow(
                                  blurRadius: 5.0,
                                  color: Colors.black.withOpacity(0.6),
                                  offset: Offset(3, 3),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          // Email Address
                          Text(
                            '📧 Email: contact@highseasjourney.com',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              shadows: [
                                Shadow(
                                  blurRadius: 5.0,
                                  color: Colors.black.withOpacity(0.6),
                                  offset: Offset(3, 3),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          // Address
                          Text(
                            '🏠 Address: 123 Ocean Blvd, Nautical City, Oceanland',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              shadows: [
                                Shadow(
                                  blurRadius: 5.0,
                                  color: Colors.black.withOpacity(0.6),
                                  offset: Offset(3, 3),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
