import 'package:flutter/material.dart';
import 'package:windows_application/data/course_data2.dart';
import 'course_widget.dart';

class CourseListScreen2 extends StatelessWidget {
  const CourseListScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Match padding from HomeWidget
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/home_bg.jpg'), // Your background image
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
                          image: AssetImage('assets/images/naval-bg1.jpg'),
                          fit: BoxFit.cover, // Your banner image
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Featured Courses",
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

                  // GridView for Courses
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // 3 courses per row
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 10,
                          childAspectRatio:
                              5.0, // Adjusted aspect ratio for card size
                        ),
                        itemCount: DataList2.courses.length,
                        itemBuilder: (context, index) {
                          final course = DataList2.courses[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CourseWidget(
                                    courseName: course.name,
                                    courseDescription: course.description,
                                    courseImage: course.image,
                                    courseDuration: course.duration,
                                    pdfPath: course.pdfPath,
                                    videoPath: course.videoPath,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 4,
                                    offset: Offset(0, 2), // Shadow position
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    // Square Image
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        course.image,
                                        height: 40, // Fixed height for image
                                        width: 40, // Fixed width for image
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(
                                        height:
                                            8), // Space between image & title

                                    // Title Below Image
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            course.name,
                                            textAlign: TextAlign.center,
                                            maxLines:
                                                2, // Limit text to 2 lines
                                            overflow: TextOverflow
                                                .ellipsis, // Handle overflow
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          Text(
                                            course.description.length > 50
                                                ? '${course.description.substring(0, 50)}...'
                                                : course.description,
                                            textAlign: TextAlign.center,
                                            maxLines:
                                                2, // Limit text to 2 lines
                                            overflow: TextOverflow
                                                .ellipsis, // Handle overflow
                                            style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                        height:
                                            4), // Space between title & bottom
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
