import 'package:academic_project/page/home_page.dart';
import 'package:academic_project/services/test.dart';
import 'package:academic_project/widget/user_years.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'auth/login_screen.dart';
import 'auth/signup_screen.dart';
import 'auth/splass-screen.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
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
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home:SplassScreen(),
    );
  }
}

