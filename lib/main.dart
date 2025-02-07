import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:provider/provider.dart';
import 'Home/courses_widget/pdf_show_widget/pdf_show_provider.dart';
import 'Home/courses_widget/video_show_widget/video_show_provider.dart';
import 'Home/provider/menu_provider.dart';
import 'Home/provider/navigation_provider.dart';
import 'Splash/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures Flutter is ready
  MediaKit.ensureInitialized(); // Initialize media_kit

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MenuProvider()),
        ChangeNotifierProvider(create: (context) => NavigationProvider()),
        ChangeNotifierProvider(create: (context) => PdfShowProvider()),
        ChangeNotifierProvider(create: (context) => VideoPlayerProvider()),
      ],
      child: StartApp(),
    ),
  );
}

class StartApp extends StatefulWidget {
  const StartApp({super.key});

  @override
  State<StartApp> createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
