import 'package:flutter/material.dart';
import 'package:podcastapp/colors.dart';

import 'Screens/bottomNavigation.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Podcast App',
      theme: ThemeData(
        primaryColor: Colors.black87,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme(
          background: Colors.black87,
          brightness: Brightness.dark,
          primary:textColor,
          onPrimary: gradient2,
          secondary: textColor,
          onSecondary:textColor ,
          error: Color(0xeca93618),
          onError: Colors.blueAccent,
          onBackground: Colors.black87,
          surface:textColor,
          onSurface: textColor,
        ),
        useMaterial3: true,
      ),
      home: BottomNavigation(),
    );
  }
}
