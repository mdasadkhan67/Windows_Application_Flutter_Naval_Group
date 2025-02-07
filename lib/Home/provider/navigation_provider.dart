import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  int _selectedIndex = 0;
  String _selectedPage = 'Home'; // To keep track of the page name

  int get selectedIndex => _selectedIndex;
  String get selectedPage => _selectedPage;

  // Update selected page and index
  void selectPage(int index, String pageName) {
    _selectedIndex = index;
    _selectedPage = pageName; // Update the page name when an item is selected
    notifyListeners(); // Notify listeners when the index and page change
  }

  // To reset the navigation if necessary
  void resetNavigation() {
    _selectedIndex = 0;
    _selectedPage = 'Home';
    notifyListeners();
  }
}
