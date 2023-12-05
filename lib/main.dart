import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screens/splashScreen.dart';
import 'colors.dart';


import 'Screens/login.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options:FirebaseOptions(
          apiKey: "AIzaSyCJG9Jefm7cYk_ehfPNtkT5YyJwK6IV3Sk",
          appId: "com.example.phone",
          messagingSenderId: "764079452608",
          projectId: "audio-hub-3904b")
  );

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
      home: SplashScreen(),
    );
  }
}
