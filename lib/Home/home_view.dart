import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'helper/widgget_manager.dart';
import 'provider/navigation_provider.dart';
import 'left_panel.dart'; // Import the LeftPanel widget

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left Panel (Navigation Drawer) - 20% Width
          const LeftPanel(), // This is the fixed left panel

          // Main Content Section (80% Width)
          Expanded(
            child: Consumer<NavigationProvider>(
              builder: (context, navigationProvider, child) {
                return WidgetManager.getWidget(navigationProvider.selectedPage);
              },
            ),
          ),
        ],
      ),
    );
  }
}
