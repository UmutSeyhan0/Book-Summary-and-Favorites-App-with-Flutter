import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qr/screen/signin.dart';
import '../screen/splashscreen.dart';
import '../screen/homescreen.dart';


void main() async { 
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        scaffoldBackgroundColor: Color(0xFFF2F2F2),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(),
      routes: {'/home': (context) => HomeScreen(),
               '/signin': (context) => Signin()},
    );
  }
}