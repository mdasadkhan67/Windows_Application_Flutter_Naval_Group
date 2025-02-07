import 'package:flutter/material.dart';
import 'package:windows_application/Home/widgets/about_widget.dart';
import '../courses_widget/course_list.dart';
import '../courses_widget/course_list2.dart';
import '../courses_widget/course_list3.dart';
import '../widgets/contact.dart';
import '../widgets/home_widget.dart';

class WidgetManager {
  // Method to get the widget based on a page name
  static Widget getWidget(String pageName) {
    final Map<String, Widget> pageMap = {
      'Home': HomeWidget(),
      'About': AboutWidget(),
      'CoursesPage1': CourseListScreen(),
      'CoursesPage2': CourseListScreen2(),
      'CoursesPage3': CourseListScreen3(),
      'Contact': ContactWidget(),
    };

    return pageMap[pageName] ??
        Center(
            child: Text(
                'Page not found')); // Return a default message if the page is not found
  }
}
