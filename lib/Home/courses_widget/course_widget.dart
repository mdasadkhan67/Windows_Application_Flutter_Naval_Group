import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../left_panel_inner.dart';
import 'pdf_show_widget/pdf_view_widget.dart';
import 'video_show_widget/video_show_widget.dart';

class CourseWidget extends StatefulWidget {
  final String courseName;
  final String courseDescription;
  final String courseImage;
  final String courseDuration;
  final String pdfPath; // Local PDF Path
  final String videoPath; // Local Video Path

  const CourseWidget({
    super.key,
    this.courseName = "",
    this.courseDescription = "",
    this.courseImage = "",
    this.courseDuration = "",
    this.pdfPath = "",
    this.videoPath = "",
  });

  @override
  State<CourseWidget> createState() => _CourseWidgetState();
}

class _CourseWidgetState extends State<CourseWidget> {
  void _openVideo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoPlayerScreen(videoPath: widget.videoPath),
      ),
    );
  }

  void _openPdf() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFViewWidget(pdfPath: widget.pdfPath),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          LeftPanelInner(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(
                  8.0), // Match padding from CourseListScreen
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/naval-bg1.jpg'), // Your background image
                    fit: BoxFit.cover, // Stretch the image to cover the screen
                  ),
                ),
                child: Stack(
                  children: [
                    // Dark Overlay to make content more readable
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black
                            .withOpacity(0.6), // Semi-transparent dark overlay
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Column(
                      children: [
                        // Banner Section (Image or Text)
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            width: double.infinity,
                            height: 200, // Height of the banner
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/naval-bg1.jpg'),
                                fit: BoxFit.cover, // Your banner image
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  widget.courseName,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.black.withOpacity(0.7),
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Main Course Content
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.3)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Left Side (Text Content)
                                Expanded(
                                  flex: 2,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Course Name
                                        Text(
                                          widget.courseName,
                                          style: GoogleFonts.roboto(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 10),

                                        // Course Duration
                                        Text(
                                          "Duration: ${widget.courseDuration}",
                                          style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            color: Colors.white70,
                                          ),
                                        ),
                                        const SizedBox(height: 15),

                                        // Course Description
                                        Text(
                                          widget.courseDescription,
                                          style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // Right Side (Big Icons for PDF and Video)
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Open PDF Icon
                                    GestureDetector(
                                      onTap: _openPdf,
                                      child: Container(
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          color: Colors.redAccent,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: const Icon(
                                          Icons.picture_as_pdf,
                                          color: Colors.white,
                                          size: 60,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 30),

                                    // Play Video Icon
                                    GestureDetector(
                                      onTap: _openVideo,
                                      child: Container(
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          color: Colors.blueAccent,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: const Icon(
                                          Icons.play_circle_fill,
                                          color: Colors.white,
                                          size: 60,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
