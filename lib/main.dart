import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ocr_app/constant/route.dart';
import 'package:ocr_app/pages/account.dart';
import 'package:ocr_app/pages/history.dart';
import 'package:ocr_app/pages/home_screen.dart';
import 'package:ocr_app/pages/signin_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ocr_app/pages/signup_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OCR App asu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: loginRoute,
      routes: {
        loginRoute: (context) => const SignInScreen(),
        registerRoute: (context) => const SignUpScreen(),
        homeRoute: (context) => const HomeScreen(),
        historyRoute: (context) => const HistoryPage(),
        accountRoute: (context) => const AccountPage(),
      },
      // home: const HomeScreen(),
    );
  }
}
