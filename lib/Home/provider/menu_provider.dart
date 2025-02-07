import 'package:flutter/material.dart';
import 'package:windows_application/Home/courses_widget/course_widget.dart';
import 'package:windows_application/Home/widgets/about_widget.dart';
import 'package:windows_application/Home/widgets/contact.dart';
import 'package:windows_application/Home/widgets/home_widget.dart';

class MenuProvider with ChangeNotifier {
  // List of menu items
  final List<Map<String, dynamic>> _menuItems = [
    {'title': 'Home', 'page': HomeWidget(), 'icon': Icons.home},
    {'title': 'About', 'page': AboutWidget(), 'icon': Icons.person},
    {'title': 'Courses', 'page': CourseWidget(), 'icon': Icons.book},
    {'title': 'Contact', 'page': ContactWidget(), 'icon': Icons.contact_phone},
  ];

  // Getter for menu items
  List<Map<String, dynamic>> get menuItems => _menuItems;

  // To allow updates or changes in the menu items if needed
  void updateMenuItem(int index, Map<String, dynamic> newItem) {
    _menuItems[index] = newItem;
    notifyListeners();
  }
}
